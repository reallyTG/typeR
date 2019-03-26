library(mirt)


### Name: expected.test
### Title: Function to calculate expected test score
### Aliases: expected.test
### Keywords: expected score

### ** Examples


## Not run: 
##D dat <- expand.table(deAyala)
##D model <- 'F = 1-5
##D           CONSTRAIN = (1-5, a1)'
##D mod <- mirt(dat, model)
##D 
##D Theta <- matrix(seq(-6,6,.01))
##D tscore <- expected.test(mod, Theta)
##D tail(cbind(Theta, tscore))
##D 
##D # use only first two items (i.e., a bundle)
##D bscore <- expected.test(mod, Theta, which.items = 1:2)
##D tail(cbind(Theta, bscore))
##D 
## End(Not run)



