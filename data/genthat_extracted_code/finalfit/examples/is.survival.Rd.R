library(finalfit)


### Name: is.survival
### Title: Test character describes survival object
### Aliases: is.survival
### Keywords: internal

### ** Examples

var_s = "Surv(mort, time)"
is.survival(var_s) #TRUE
var_s = "Sur(mort, time)"
is.survival(var_s) #FALSE



