library(car)


### Name: hist.boot
### Title: Methods Functions to Support 'boot' Objects
### Aliases: hist.boot summary.boot confint.boot vcov.boot Confint.boot
### Keywords: regression

### ** Examples

m1 <- lm(Fertility ~ ., swiss)
betahat.boot <- Boot(m1, R=99) # 99 bootstrap samples--too small to be useful
summary(betahat.boot)  # default summary
confint(betahat.boot)
hist(betahat.boot)



