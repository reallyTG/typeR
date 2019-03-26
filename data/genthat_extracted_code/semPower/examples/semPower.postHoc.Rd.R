library(semPower)


### Name: semPower.postHoc
### Title: semPower.postHoc
### Aliases: semPower.postHoc

### ** Examples

## Not run: 
##D power <- semPower.postHoc(effect = .05, effect.measure = "RMSEA", alpha = .05, N = 250, df = 200)
##D power
##D power <- semPower.postHoc(N = 1000, df = 5, alpha = .05,  
##D                           SigmaHat = diag(4), Sigma = cov(matrix(rnorm(4*1000),  ncol=4)))
##D power
## End(Not run)



