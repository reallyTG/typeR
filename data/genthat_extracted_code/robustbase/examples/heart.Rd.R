library(robustbase)


### Name: heart
### Title: Heart Catherization Data
### Aliases: heart
### Keywords: datasets

### ** Examples

data(heart, package="robustbase")
heart.x <- data.matrix(heart[, 1:2]) # the X-variables
plot(heart.x)
covMcd(heart.x)
summary( lm.heart <-     lm(clength ~ . , data = heart))
summary(lts.heart <- ltsReg(clength ~ . , data = heart))



