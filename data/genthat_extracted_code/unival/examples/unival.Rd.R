library(unival)


### Name: unival
### Title: Assessing essential unidimensionality using external validity
###   information
### Aliases: unival

### ** Examples

## perform unidimensionality analysis using an example dataset. The dataset is composed by the
## criterion and the factor scores, already computed using FACTOR. The correlation between factors
## was also obtained using this program. An alternative could be using the functions included in
## mirt package (Chalmers, 2012).

y = SAS3f[,1]
FP = as.matrix(SAS3f[,2:4])
fg = SAS3f[,5]
PHI = cbind(c(1,0.408,0.504),c(0.408,1,0.436),c(0.504,0.436,1))

unival(y = y, FP = FP, fg = fg, PHI = PHI)




