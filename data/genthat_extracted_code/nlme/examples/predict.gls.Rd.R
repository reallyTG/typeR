library(nlme)


### Name: predict.gls
### Title: Predictions from a gls Object
### Aliases: predict.gls
### Keywords: models

### ** Examples

fm1 <- gls(follicles ~ sin(2*pi*Time) + cos(2*pi*Time), Ovary,
           correlation = corAR1(form = ~ 1 | Mare))
newOvary <- data.frame(Time = c(-0.75, -0.5, 0, 0.5, 0.75))
predict(fm1, newOvary)



