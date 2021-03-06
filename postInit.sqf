lastVehID = "none";
systemChat "Init";

player addEventHandler ["GetInMan", {
	_var = (_this select 2);
	if((_var isKindOf "Car") || (_var isKindOf "Air") || (_var isKindOf "Ship")) then {
		systemChat "Entered Vehicle";
		lastVehID = (_var call BIS_fnc_netId);
	};
}];

player addEventHandler ["Respawn", {
	lastVehID = "none";
	
	player addEventHandler ["GetInMan", {
		_var = (_this select 2);
		if((_var isKindOf "Car") || (_var isKindOf "Air") || (_var isKindOf "Ship")) then {
			systemChat "Entered Vehicle";
			lastVehID = (_var call BIS_fnc_netId);
		};
	}];
	
	act_car = player addAction [
		"Add to vehicle", 
		MLS_fnc_buttonAction, 
		"",
		1.5,
		false,
		true,
		"",
		'
			_show = false;
			_trg = cursorTarget;
			if((_trg isKindOf "Man" && (!alive _trg)) || (_trg isKindOf "WeaponHolderSimulated") || (_trg isKindOf "WeaponHolder")) then {
				if ((player distance2D cursorTarget) <= 3.5) then {
					_show = true;
				}
			};
			_show
		'
	];
}];

player addEventHandler ["Killed", {
	player removeAction act_car;
}];

act_car = player addAction [
	"Add to vehicle", 
	MLS_fnc_buttonAction, 
	"",
	1.5,
	false,
	true,
	"",
	'
		_show = false;
		_trg = cursorTarget;
		if((_trg isKindOf "Man" && (!alive _trg)) || (_trg isKindOf "WeaponHolderSimulated") || (_trg isKindOf "WeaponHolder")) then {
			if ((player distance2D cursorTarget) <= 3.5) then {
				_show = true;
			}
		};
		_show
	'
];


