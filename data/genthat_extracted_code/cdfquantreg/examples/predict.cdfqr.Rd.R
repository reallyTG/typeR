library(cdfquantreg)


### Name: predict.cdfqr
### Title: Methods for Cdfqr Objects
### Aliases: predict.cdfqr fitted.cdfqr fitted.cdfqr predict.cdfqrH
###   fitted.cdfqrH

### ** Examples

data(cdfqrExampleData)
fit <- cdfquantreg(crc99 ~ vert | confl, 't2','t2', data = JurorData)

plot(predict(fit))
plot(predict(fit))



