library(psyosphere)


### Name: val_psyo
### Title: Validate psyo format
### Aliases: val_psyo

### ** Examples
## No test: 
# Produce a warning ------------------------------------------------------------
data(psyo)
psyo$time <- NULL # remove time column
e <- val_psyo(psyo); if (e != "") {stop(e)}

# Produce a stop ---------------------------------------------------------------
data(psyo)
psyo$time <- NULL # remove time column
e <- val_psyo(psyo, time = 2); if (e != "") {stop(e)}

# Produce a stop without setting "force" ---------------------------------------
data(psyo)
psyo$lon <- NULL # remove time column
e <- val_psyo(psyo); if (e != "") {stop(e)}
## End(No test)


