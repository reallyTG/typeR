library(MANOVA.RM)


### Name: MANOVA
### Title: Tests for Multivariate Data in Semi-Parametric Factorial Designs
### Aliases: MANOVA

### ** Examples

data(EEG)
EEG_mod <- MANOVA(resp ~ sex * diagnosis, 
                    data = EEG, subject = "id", resampling = "paramBS", 
                    alpha = 0.05, iter = 100, CPU = 1)
summary(EEG_mod)




