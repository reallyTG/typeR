library(demography)


### Name: compare.demogdata
### Title: Evaluation of demographic forecast accuracy
### Aliases: compare.demogdata
### Keywords: models

### ** Examples

fr.test <- extract.years(fr.sm,years=1921:1980)
fr.fit <- fdm(fr.test,order=2)
fr.error <- compare.demogdata(fr.mort, forecast(fr.fit,20))
plot(fr.error)
par(mfrow=c(2,1))
plot(fr.error$age,fr.error$mean.error[,"ME"],
    type="l",xlab="Age",ylab="Mean Forecast Error")
plot(fr.error$int.error[,"ISE"],
    xlab="Year",ylab="Integrated Square Error")



