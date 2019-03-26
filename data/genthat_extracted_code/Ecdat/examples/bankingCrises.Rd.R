library(Ecdat)


### Name: bankingCrises
### Title: Countries in Banking Crises
### Aliases: bankingCrises
### Keywords: datasets

### ** Examples

data(bankingCrises)
numberOfCrises <- rowSums(bankingCrises[-1], na.rm=TRUE)
plot(bankingCrises$year, numberOfCrises, type='b')

# Write to a file for Wikimedia Commons
svg('bankingCrises.svg')
plot(bankingCrises$year, numberOfCrises, type='b', cex.axis=2,
     las=1, xlab='', ylab='', bty='n', cex=0.5)
abline(v=c(1945, 1971), lty='dashed', col='blue')
text(1958, 14, 'Bretton Woods', srt=90, cex=2, col='blue')
dev.off()



