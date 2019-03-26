library(Haplin)


### Name: snpPower
### Title: Power calculations for a single SNP
### Aliases: snpPower

### ** Examples

## Not run: 
##D ## Compute power for a single SNP,
##D ## for the combination of 1000 case triads, RR = 1.2, MAF = 0.1 and alpha = 0.05
##D snpPower(cases = list(mfc = 1000), controls = list(mfc = 0), RR = 1.2, MAF = 0.1)
##D 
##D ## Compute power for a single SNP,
##D ## for the combination of 1000 case triads and 500 single case children (altogether),
##D ## 5000 control triads, RR = 1.1, MAF = 0.1 and alpha = 0.05
##D snpPower(cases = list(mfc = 1000, c = 500), controls = list(mfc=5000),
##D RR = 1.1, MAF = 0.1, alpha = 0.05)
##D 
##D ## Compute power for a single SNP,
##D ## for the combination of 500 case triads, 10000 control triads, 
##D ## relative risk of 1.2 and minor allele frequency of 0.1,
##D ## and also for the combination of 1000 case triads, 10000 control triads,
##D ## relative risk of 1.1 and minor allele frequency of 0.1
##D snpPower(cases = list(mfc = c(500, 1000)), controls = list(mfc = 10000),
##D RR = c(1.2, 1.1), MAF = 0.1)
## End(Not run)



