library(RPPanalyzer)


### Name: calcSdc
### Title: Calculates the concentration of serial diluted samples
### Aliases: calcSdc
### Keywords: manip

### ** Examples

    library(RPPanalyzer)
    data(ser.dil.samples)

    ser.dil_median <- sample.median(ser.dil.samples)
    predicted.data <- calcSdc(ser.dil_median,D0=2,sel=c("measurement"), dilution="dilution")



