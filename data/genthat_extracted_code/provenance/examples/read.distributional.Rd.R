library(provenance)


### Name: read.distributional
### Title: Read a .csv file with continuous (detrital zircon) data
### Aliases: read.distributional

### ** Examples

    agefile <- system.file("DZ.csv",package="provenance")
    errfile <- system.file("DZerr.csv",package="provenance")
    DZ <- read.distributional(agefile,errfile)
    plot(KDE(DZ$x$N1))



