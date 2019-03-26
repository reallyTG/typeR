library(EMSC)


### Name: plot.EMSC
### Title: Plot, print and summary methods for EMSC
### Aliases: plot.EMSC print.EMSC summary.EMSC print.EMSC summary.EMSC

### ** Examples

data(fishoil, package = "EMSC")
Raman      <- fishoil$Raman[, 850:3300]
EMSC.rep   <- EMSC(Raman, degree = 6, reference = Raman[30, ],
                   replicates = fishoil$replicates)
plot(EMSC.rep)
                   



