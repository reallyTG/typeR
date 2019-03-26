library(BIOdry)


### Name: plot.modelFrame
### Title: Plot modelFrame objects
### Aliases: plot.modelFrame

### ** Examples

##TRW chronology (mm) and reference inside-bark radii (mm)
##measured at 2003:
data(Pchron,envir = environment())
data(Pradii03,envir = environment())
## Tree-ring width fluctuations:
trwf <- modelFrame(Pchron,
                   sc.c = Pradii03,
                   rf.t = 2003,
                   log.t = TRUE)
plot(trwf, grid = FALSE)




