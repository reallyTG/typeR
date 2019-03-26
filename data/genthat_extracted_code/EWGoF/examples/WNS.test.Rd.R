library(EWGoF)


### Name: WNS.test
### Title: GoF tests based on the normalized spacings for the Weibull
###   distribution
### Aliases: WNS.test
### Keywords: normalized spacings Tiku-Singh statistic Mann-Scheuer-Fertig
###   statistic Lockhart-O'Reilly-Stephens test statistic

### ** Examples

x1 <- rweibull(50,2,3)

#Apply the Tiku-Singh test with censored sample: 4 left censored and 5 right censored values
## Not run: 
##D WNS.test(x1,type="TS",s=4,r=5)
## End(Not run)






