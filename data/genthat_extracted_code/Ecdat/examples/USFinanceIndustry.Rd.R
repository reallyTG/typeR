library(Ecdat)


### Name: USFinanceIndustry
### Title: US Finance Industry Profits
### Aliases: USFinanceIndustry
### Keywords: datasets

### ** Examples

data(USFinanceIndustry)
plot(FinanceProportion~year, USFinanceIndustry, type='b',
     ylim=c(0, max(FinanceProportion, na.rm=TRUE)),
     xlab='', ylab='', las=1, cex.axis=2, bty='n', lwd=2,
     col='blue')

# Write to a file for Wikimedia Commons
svg('USFinanceIndustry.svg')
plot(FinanceProportion~year, USFinanceIndustry, type='b',
     ylim=c(0, max(FinanceProportion, na.rm=TRUE)),
     xlab='', ylab='', las=1, cex.axis=2, bty='n', lwd=2,
     col='blue')
dev.off()



