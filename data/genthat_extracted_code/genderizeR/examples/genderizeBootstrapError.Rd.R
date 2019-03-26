library(genderizeR)


### Name: genderizeBootstrapError
### Title: Gender prediction errors on bootstrap samples
### Aliases: genderizeBootstrapError

### ** Examples

## Not run: 
##D 
##D x <- c('Alex', 'Darrell', 'Kale', 'Lee', 'Robin', 'Terry', rep('Robin', 20))
##D 
##D y <- c(rep('female', 6), rep('male', 20))
##D 
##D givenNamesDB = findGivenNames(x)
##D pred = genderize(x, givenNamesDB)
##D classificationErrors(labels = y, predictions = pred$gender)
##D 
##D probs = seq(from =  0.5, to = 0.9, by = 0.05)
##D counts = c(1)
##D 
##D set.seed(23)
##D genderizeBootstrapError(x = x, y = y, 
##D                          givenNamesDB = givenNamesDB, 
##D                          probs = probs, counts = counts, 
##D                          num_bootstraps = 20, 
##D                          parallel = TRUE)
##D 
##D 
##D # $apparent
##D # [1] 0.9615385
##D 
##D # $loo_boot
##D # [1] 0.965812
##D 
##D # $errorRate632plus
##D # [1] 0.964225
##D 
##D 
## End(Not run)




