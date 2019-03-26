library(pls)


### Name: selectNcomp
### Title: Suggestions for the optimal number of components in PCR and PLSR
###   models
### Aliases: selectNcomp
### Keywords: regression multivariate

### ** Examples

data(yarn)
yarn.pls <- plsr(density ~ NIR, data = yarn, scale = TRUE,
                 ncomp = 20, validation = "LOO") 
selectNcomp(yarn.pls, "onesigma", plot = TRUE, ylim = c(0, 3))
selectNcomp(yarn.pls, "randomization", plot = TRUE)
selectNcomp(yarn.pls, "randomization", plot = TRUE,
            ncomp = 10, ylim = c(0, 3))



