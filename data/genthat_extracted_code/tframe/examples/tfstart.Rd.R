library(tframe)


### Name: tfstart
### Title: Extract Time Frame Information
### Aliases: tfstart tfstart.default tfstart.tstframe start.tframed
###   start.tframe tfend tfend.default tfend.tstframe end.tframed
###   end.tframe tffrequency tffrequency.default frequency.tframed
###   frequency.tframe Tobs Tobs.default Tobs.tframed Tobs.tframe
###   Tobs.stamped tftime tftime.default time.tframed time.tframe
### Keywords: programming utilities ts chron

### ** Examples

    z <- ts(rnorm(100), start=c(1982,1), frequency=12)
    tfstart(z)
    z <- tframed(matrix(rnorm(200), 100,2), 
            tf=list(start=c(1982,1), frequency=12))
    tfend(z)
    Tobs(z)
    time(z)



