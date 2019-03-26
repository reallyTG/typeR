library(bootstrap)


### Name: tooth
### Title: Tooth Strength Data
### Aliases: tooth
### Keywords: datasets

### ** Examples

str(tooth)
mod.easy <-  lm(strength ~ E1+E2, data=tooth)
mod.diffi <- lm(strength ~ D1+D2, data=tooth)
summary(mod.easy)
summary(mod.diffi)
if(interactive())par(ask=TRUE)
theta <- function(ind) {
    easy <- lm(strength ~ E1+E2, data=tooth, subset=ind)
    diffi<- lm(strength ~ D1+D2, data=tooth, subset=ind)
    (sum(resid(easy)^2) - sum(resid(diffi)^2))/13   }
tooth.boot <- bootstrap(1:13, 2000, theta)
hist(tooth.boot$thetastar)
abline(v=0, col="red2") 
qqnorm(tooth.boot$thetastar)
qqline(tooth.boot$thetastar, col="red2")



