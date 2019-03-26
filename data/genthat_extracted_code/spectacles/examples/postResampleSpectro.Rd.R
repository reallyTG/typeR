library(spectacles)


### Name: postResampleSpectro
### Title: Calculates performance indictors across resamples
### Aliases: postResampleSpectro spectroSummary

### ** Examples

predicted <-  matrix(rnorm(50), ncol = 5)
observed <- rnorm(10)
apply(predicted, 2, postResampleSpectro, obs = observed)



