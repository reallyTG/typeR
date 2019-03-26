library(rcompanion)


### Name: pairwisePercentileTest
### Title: Pairwise permutation tests for percentiles
### Aliases: pairwisePercentileTest

### ** Examples

## Not run: 
##D data(BrendonSmall)
##D PT = pairwisePercentileTest(Sodium ~ Instructor, 
##D                             data = BrendonSmall, 
##D                             test = "percentile", 
##D                             tau  = 0.75)
##D PT
##D cldList(p.adjust ~ Comparison,
##D         data       = PT,
##D         threshold  = 0.05)
##D         
##D data(BrendonSmall)
##D PT = pairwisePercentileTest(Sodium ~ Instructor, 
##D                             data       = BrendonSmall, 
##D                             test       = "proportion", 
##D                             threshold  = 1300)
##D PT
##D cldList(p.adjust ~ Comparison,
##D         data       = PT,
##D         threshold  = 0.05)                         
## End(Not run)




