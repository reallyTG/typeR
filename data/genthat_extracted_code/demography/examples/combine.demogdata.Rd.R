library(demography)


### Name: combine.demogdata
### Title: Combine two demogdata objects into one demogdata object
### Aliases: combine.demogdata
### Keywords: manip

### ** Examples

fit <- fdm(fr.mort)
fcast <- forecast(fit, h=50)
france2 <- combine.demogdata(fr.mort,fcast)
plot(france2)
plot(life.expectancy(france2))
lines(rep(max(fr.mort$year)+0.5,2),c(0,100),lty=3)



