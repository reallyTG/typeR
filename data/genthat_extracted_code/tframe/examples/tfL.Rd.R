library(tframe)


### Name: tfL
### Title: Time Series Shifting and Differencing
### Aliases: tfL tfL.default tfL.tframe diff.tframe diff.tframed
### Keywords: programming utilities ts

### ** Examples

    z <- ts(rnorm(100), start=c(1982,1), frequency=12)
    tfstart(z)
    Tobs(z)
    z <- diff(z)
    tfstart(z)
    Tobs(z)

    ts(1:5) - tfL(ts(1:5))
    (1:5) - tfL(1:5) # (1:5) this is not a tframed object, so minus is the default
    ts(1:5) - tfL(ts(1:5), p= 2)

    z <- ts(1:10, start=c(1992,1), frequency=4)
    z - tfL(z)

    z <- ts(matrix(1:10,5,2), start=c(1992,1), frequency=4)
    seriesNames(z) <- c("One", "Two")
    z - tfL(z)



