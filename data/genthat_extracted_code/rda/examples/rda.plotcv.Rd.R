library(rda)


### Name: plot.rdacv
### Title: A function that plots the result from rda.cv
### Aliases: plot.rdacv

### ** Examples

data(colon)
fit <- rda(t(colon.x), colon.y)
fit.cv <- rda.cv(fit, x=t(colon.x), y=colon.y)
plot.rdacv(fit.cv)



