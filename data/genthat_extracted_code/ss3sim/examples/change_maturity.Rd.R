library(ss3sim)


### Name: change_maturity
### Title: Alter a control file to specify the SS3 maturity option
### Aliases: change_maturity

### ** Examples

# Create a temporary folder for the output:
temp_path <- file.path(tempdir(), "ss3sim-maturity-example")
dir.create(temp_path, showWarnings = FALSE)
wd <- getwd()
setwd(temp_path)

# Locate the package data:
ctlfile <- system.file("extdata", "models", "cod-em",
 "codEM.ctl", package = "ss3sim")

# Change the maturity option from 1 to 5:
change_maturity(ctlfile, "test.ctl", maturity_option = 5L)

unlink("test.ctl")
setwd(wd)



