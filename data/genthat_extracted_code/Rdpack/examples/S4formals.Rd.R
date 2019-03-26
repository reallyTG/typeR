library(Rdpack)


### Name: S4formals
### Title: Give the formal arguments of an S4 method
### Aliases: S4formals
### Keywords: methods

### ** Examples

require(stats4) # makes plot() S4 generic

S4formals("plot", c(x = "profile.mle", y = "missing"))

m1 <- getMethod("plot", c(x = "profile.mle", y = "missing"))
S4formals(m1)



