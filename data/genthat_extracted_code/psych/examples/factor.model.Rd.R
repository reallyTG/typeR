library(psych)


### Name: factor.model
### Title: Find R = F F' + U2 is the basic factor model
### Aliases: factor.model
### Keywords: multivariate models

### ** Examples


f2 <- matrix(c(.9,.8,.7,rep(0,6),.6,.7,.8),ncol=2)
mod <- factor.model(f2)
round(mod,2)



