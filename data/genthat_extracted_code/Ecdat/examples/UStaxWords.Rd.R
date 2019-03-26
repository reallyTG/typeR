library(Ecdat)


### Name: UStaxWords
### Title: Number of Words in US Tax Law
### Aliases: UStaxWords
### Keywords: datasets

### ** Examples

data(UStaxWords)
plot(EntireTaxCodeAndRegs/1000 ~ year, UStaxWords, 
  type='b',
  ylab='Millions of words in US tax code & regs')

# Write to a file for Wikimedia Commons
## Not run: 
##D svg('UStaxWords.svg')
## End(Not run)
matplot(UStaxWords$year, UStaxWords[c(2:3, 5:6)]/1000,
    type='b', bty='n', ylab='',
    ylim=c(0, max(UStaxWords$EntireTaxCodeAndRegs)/1000),
    las=1, xlab="", cex.axis=2)
lines(EntireTaxCodeAndRegs/1000~year, UStaxWords, lwd=2)
## Not run: 
##D dev.off()
## End(Not run)
# lines 1:4 = IncomeTaxCode, otherTaxCode, 
#   IncomeTaxRegulations,
#   and otherTaxRegulations, respectively

##
## Plotting the original numbers without the adjustment
##
UStax. <- UStaxWords
UStax.[2,c(6:7, 9:10)] <- c(1322, 2960, 1626, 3507)
matplot(UStax.$year, UStax.[c(2:3, 5:6)]/1000,
      type='b', bty='n', ylab='',
      ylim=c(0, max(UStax.$EntireTaxCodeAndRegs)/1000),
      las=1, xlab="", cex.axis=2)
lines(EntireTaxCodeAndRegs/1000~year, UStax., lwd=2)
# Note especially the anomalous behaviour of line 4 =
# otherTaxRegulations.  As noted with "details" above,
# otherTaxRegulations could have tripled between 1955 
# and 1965, then fallen by 48 percent between 1965 and
# 1975.  However, that does not seem credible, 
# especially since there was no corresponding behavior 
# in otherTaxCode.

##
## linear trend 
##
(newWdsPerYr <- lm(EntireTaxCodeAndRegs~year, 
    UStaxWords))
plot(UStaxWords$year, resid(newWdsPerYr))
# Roughly 150,000 additional words added each year
# since 1955.  
# No indication of nonlinearity.  




