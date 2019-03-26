library(Haplin)


### Name: snpSampleSize
### Title: Sample size calculations for a single SNP
### Aliases: snpSampleSize

### ** Examples

## Not run: 
##D ## Compute sample sizes for a single SNP,
##D ## when the specified case family design is a full triad, there are no control families,
##D ## RR = 1.1, MAF = 0.1, alpha = 0.05 and power = 0.9
##D snpSampleSize(fam.cases = "mfc", fam.controls = "no_controls", 
##D RR = 1.1, MAF = 0.1, alpha = 0.05, power = 0.9)
##D 
##D ## Compute sample sizes for a single SNP,
##D ## for the combination of case triads, control triads, fraction = 0.5, RR = 1.2, 
##D ## MAF = 0.1, alpha = 0.05 and power = 0.8, and also for the combination of case triads,
##D ## control children, fraction = 0.5, RR = 1.2, MAF = 0.1, alpha = 0.05 and power = 0.9
##D snpSampleSize(fam.cases = "mfc", fam.controls = c("mfc", "c"), 
##D RR = 1.2, MAF = 0.1, alpha = 0.05, power = c(0.8, 0.9))
## End(Not run)



