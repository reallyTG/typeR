library(KarsTS)


### Name: myLinModel
### Title: myLinModel: performs a linear fit
### Aliases: myLinModel
### Keywords: ~kwd1 ~kwd2

### ** Examples


observed <- genTSExample(stationary = FALSE, InKTSEnv = FALSE)$value
predicted <- observed + stats::rnorm(stats::rnorm(length(observed)))
myLinModel(observed, predicted)




