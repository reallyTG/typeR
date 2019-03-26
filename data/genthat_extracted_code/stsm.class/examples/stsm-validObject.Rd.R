library(stsm.class)


### Name: stsm-validObject-methods
### Title: Check the Validity of an Object of Class 'stsm'
### Aliases: stsm-validObject-methods check.bounds check.bounds,stsm-method
###   validObject validObject,stsm-method
### Keywords: methods

### ** Examples

m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var1" = 2, "var2" = 15, "var3" = 30))
validObject(m)

# force a wrong value (negative variance)
m@pars[1] <- -1
try(validObject(m))
try(check.bounds(m))

# duplicates not allowed
m <- stsm.model(model = "llm+seas", y = JohnsonJohnson, 
  pars = c("var1" = 2, "var2" = 15, "var3" = 30))
# try to define 'var1', already in 'pars', in the slot 'nopars'
try(m <- set.nopars(m, c(var1=22)))
# force a duplicate
m@nopars <- c(m@nopars, var1 = 22)
try(validObject(m))



