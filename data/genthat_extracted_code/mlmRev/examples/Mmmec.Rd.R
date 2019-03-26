library(mlmRev)


### Name: Mmmec
### Title: Malignant melanoma deaths in Europe
### Aliases: Mmmec
### Keywords: datasets

### ** Examples

str(Mmmec)
summary(Mmmec)
(fm1 <- glmer(deaths ~ uvb + (1|region), Mmmec, poisson, offset = log(expected)))



