library(NCmisc)


### Name: exists.not.function
### Title: Does object exist ignoring functions The exists() function can
###   tell you whether an object exists at all, or whether an object exists
###   with a certain type, but it can be useful to know whether an object
###   exists as genuine data (and not a function) which can be important
###   when a variable or object is accidently or intentionally given the
###   same name as a function. This function usually returns a logical
###   value as to the existence of the object (ignoring functions) but can
###   also be set to return the non-function type if the object exists.
### Aliases: exists.not.function

### ** Examples

x <- "test"
# the standard exists function, for all modes, correct mode, and other modes:
exists("x")
exists("x",mode="character")
exists("x",mode="numeric")
# standard case for a non-function variable
exists.not.function("x",TRUE)
# compare results for a non-existent variable
exists("aVarNotSeen")
exists.not.function("aVarNotSeen")
# compare results for variable that is a function
exists("mean")
exists.not.function("mean")
# define a variable with same name as a function
mean <- 1.4
# exists.not.function returns the type of the variable ignoring the function of the same name
exists.not.function("mean",TRUE)
exists("mean",mode="function")
exists("mean",mode="numeric")



