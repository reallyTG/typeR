library(robustbase)


### Name: airmay
### Title: Air Quality Data
### Aliases: airmay
### Keywords: datasets

### ** Examples

data(airmay)
summary(lm.airmay <- lm(Y ~ ., data=airmay))

airmay.x <- data.matrix(airmay[,1:3])



