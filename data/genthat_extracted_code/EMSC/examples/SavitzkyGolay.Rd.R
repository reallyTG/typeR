library(EMSC)


### Name: SavitzkyGolay
### Title: Savitzky-Golay filtering and derivatives
### Aliases: SavitzkyGolay

### ** Examples

data(fishoil)
Raman    <- fishoil$Raman[, 850:3300]
SavGol   <- SavitzkyGolay(Raman)
old.par  <- par(mfrow = c(2,1), mar = c(4,4,1,1))
matplot(colnames(Raman), t(Raman), type = 'l',
        ylab = 'Relative intensity', xlab = 'Raw spectra')
matplot(colnames(Raman), t(SavGol), type = 'l',
        ylab = 'Relative intensity', xlab = 'Smoothed 2nd derivative')
par(old.par)



