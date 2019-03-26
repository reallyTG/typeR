cat("\nTesting val_var()\n")

data(psyo)
e <- val_var("a","character"); if (e != "") {stop(e)}
e <- val_var(1,"numeric"); if (e != "") {stop(e)}
e <- val_var(TRUE,"logical"); if (e != "") {stop(e)}
e <- val_var(psyo$lon,"numeric"); if (e != "") {stop(e)}
e <- val_var(psyo$time,"POSIXct"); if (e != "") {stop(e)}
