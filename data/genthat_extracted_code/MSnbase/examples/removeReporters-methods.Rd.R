library(MSnbase)


### Name: removeReporters-methods
### Title: Removes reporter ion tag peaks
### Aliases: removeReporters-methods removeReporters
### Keywords: methods

### ** Examples

sp1 <- itraqdata[[1]]
sp2 <- removeReporters(sp1,reporters=iTRAQ4)
sel <- mz(sp1) > 114 & mz(sp1) < 114.2
mz(sp1)[sel]
intensity(sp1)[sel]
plot(sp1,full=TRUE,reporters=iTRAQ4)
intensity(sp2)[sel]
plot(sp2,full=TRUE,reporters=iTRAQ4)



