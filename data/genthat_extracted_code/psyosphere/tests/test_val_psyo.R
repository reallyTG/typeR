cat("\nTesting val_psyo()\n")

data(psyo)
e <- val_psyo(psyo); if (e != "") {stop(e)}
