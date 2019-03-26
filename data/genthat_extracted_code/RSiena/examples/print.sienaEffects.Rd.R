library(RSiena)


### Name: print.sienaEffects
### Title: Print methods for Siena effects objects
### Aliases: print.sienaEffects summary.sienaEffects
###   print.summary.sienaEffects
### Keywords: methods

### ** Examples

mynet1 <- sienaDependent(array(c(s501, s502, s503), dim=c(50, 50, 3)))
mybeh <- sienaDependent(s50a, type="behavior")
mycovar <- coCovar(rnorm(50))
mydyadcovar <- coDyadCovar(matrix(as.numeric(rnorm(2500) > 2), nrow=50))
mydata <- sienaDataCreate(mynet1, mybeh, mycovar, mydyadcovar)
myeff <- getEffects(mydata)
myeff
summary(myeff)



