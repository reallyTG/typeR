library(geneSignatureFinder)


### Name: BHcorrection
### Title: Benjamini & Hochberg (1995) method for p-values correction
### Aliases: BHcorrection

### ** Examples

###################
data <- matrix(rnorm(50000), 10000, 5)
pvs <- apply(data, 1, function(xx) t.test(xx, alternative = "less")$p.value)
qvs <- BHcorrection(pvs)



