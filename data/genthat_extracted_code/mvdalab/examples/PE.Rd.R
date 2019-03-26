library(mvdalab)


### Name: PE
### Title: Percent Explained Variation of X
### Aliases: PE

### ** Examples


mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "none")
PE(mod1)

## Not run: 
##D data(Penta)
##D mod2 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
##D                ncomp = 2, validation = "loo")
##D PE(mod2)
## End(Not run)




