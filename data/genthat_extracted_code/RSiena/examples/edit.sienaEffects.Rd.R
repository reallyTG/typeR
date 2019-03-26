library(RSiena)


### Name: edit.sienaEffects
### Title: Allow editing of a sienaEffects object if a gui is available.
### Aliases: edit.sienaEffects
### Keywords: methods

### ** Examples
mynet1 <- sienaDependent(array(c(s501, s502, s503), dim=c(50, 50, 3)))
mybeh <- sienaDependent(s50a, type="behavior")
mycovar <- coCovar(rnorm(50))
mydyadcovar <- coDyadCovar(matrix(as.numeric(rnorm(2500) > 2), nrow=50))
mydata <- sienaDataCreate(mynet1, mybeh, mycovar, mydyadcovar)
myeff <- getEffects(mydata)
## Not run: 
##D fix(myeff)
## End(Not run)



