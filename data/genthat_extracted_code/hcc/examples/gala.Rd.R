library(hcc)


### Name: gala
### Title: Species diversity on the Galapagos Islands
### Aliases: gala
### Keywords: datasets

### ** Examples

data(gala)
gala <- gala[,-2]
modt <- lm(sqrt(Species) ~ . , gala)
res <- resid(modt)
hctest(gala[,3], residuals(modt))



