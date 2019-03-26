library(BAS)


### Name: image.bas
### Title: Images of models used in Bayesian model averaging
### Aliases: image.bas image
### Keywords: regression

### ** Examples


require(graphics)
data("Hald")
hald.ZSprior <- bas.lm(Y ~ ., data = Hald, prior = "ZS-null")
image(hald.ZSprior, drop.always.included = TRUE) # drop the intercept



