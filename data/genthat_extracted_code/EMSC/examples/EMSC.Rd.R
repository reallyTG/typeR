library(EMSC)


### Name: EMSC
### Title: Extended multiplicative signal correction (EMSC)
### Aliases: EMSC

### ** Examples

data(fishoil)
Raman      <- fishoil$Raman[, 850:3300]
EMSC.basic <- EMSC(Raman)
EMSC.poly6 <- EMSC(Raman, degree = 6)
EMSC.rep   <- EMSC(Raman, degree = 6, reference = Raman[30, ],
                   replicates = fishoil$replicates)

## Not run: 
##D old.par  <- par(mfrow = c(2,2), mar = c(4,4,1,1))
##D xlim     <- rev(as.numeric(range(colnames(Raman))))
##D matplot(colnames(Raman), t(Raman), type = 'l', xlim = xlim,
##D         ylab = 'Relative intensity', xlab = 'Raw spectra')
##D matplot(colnames(Raman), t(EMSC.basic$corrected), type = 'l', xlim = xlim,
##D         ylab = 'Relative intensity', xlab = 'Corrected (basic)')
##D matplot(colnames(Raman), t(EMSC.poly6$corrected), type = 'l', xlim = xlim,
##D         ylab = 'Relative intensity', xlab = 'Corrected (6th degree polynomial)')
##D matplot(colnames(Raman), t(EMSC.rep$corrected),   type = 'l', xlim = xlim,
##D         ylab = 'Relative intensity', 
##D         xlab = 'Corrected (reference = spec. #30, replicate correction (90%))')
##D par(old.par)
## End(Not run)




