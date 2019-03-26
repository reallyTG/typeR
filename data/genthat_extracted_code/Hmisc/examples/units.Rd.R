library(Hmisc)


### Name: units
### Title: Units Attribute of a Vector
### Aliases: units units.default units.Surv units<-.default
### Keywords: utilities interface

### ** Examples

fail.time <- c(10,20)
units(fail.time) <- "Day"
describe(fail.time)
S <- Surv(fail.time)
units(S)

label(fail.time) <- 'Failure Time'
fail.time



