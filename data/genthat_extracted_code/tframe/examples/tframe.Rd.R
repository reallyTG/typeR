library(tframe)


### Name: tframe
### Title: Extract or Set a tframe
### Aliases: as.tframe as.tframed tframe tframe.default tframe.ts tframe<-
###   tfSet tfSet.default tfSet.list tfSet.tstframe tframed tframed.default
###   is.tframe is.tframed
### Keywords: programming utilities ts chron

### ** Examples

    z <- tframe(ts(rnorm(100), start=c(1982,1), frequency=12))
    z
    is.tframe(z)
    zz <- tframed(matrix(rnorm(200), 100,2), tf=z)
    is.tframed(zz)
    zzz <- tframed(matrix(rnorm(200), 100,2), tf=zz)
    is.tframed(zzz)
    tframe(zzz)
    
    as.tframe(start=c(1992,1), end=c(1996,3), frequency=4)
    Tobs(as.tframe(start=c(1992,1), end=c(1996,3), frequency=4))
    end(as.tframe(start=c(1992,1), end=c(1996,3), frequency=4))

    z <- tframed(rnorm(100), start=c(1982,1), frequency=12)



