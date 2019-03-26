library(BSDA)


### Name: Toaster
### Title: Consumer Reports (Oct 94) rating of toaster ovens versus the
###   cost
### Aliases: Toaster
### Keywords: datasets

### ** Examples


plot(cost ~ score, data = Toaster)
model <- lm(cost ~ score, data = Toaster)
summary(model)
names(summary(model))
summary(model)$r.squared
plot(model, which = 1)




