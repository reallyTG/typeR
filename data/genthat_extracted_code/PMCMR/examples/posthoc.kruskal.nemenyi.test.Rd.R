library(PMCMR)


### Name: posthoc.kruskal.nemenyi.test
### Title: Pairwise Test for Multiple Comparisons of Mean Rank Sums
###   (Nemenyi-Tests)
### Aliases: posthoc.kruskal.nemenyi.test
###   posthoc.kruskal.nemenyi.test.default
###   posthoc.kruskal.nemenyi.test.formula
### Keywords: htest nonparametric

### ** Examples

##
require(stats) 
data(InsectSprays)
attach(InsectSprays)
kruskal.test(count, spray)
posthoc.kruskal.nemenyi.test(count, spray)
posthoc.kruskal.nemenyi.test(count, spray, "Chisq")
detach(InsectSprays)
rm(InsectSprays)
## Formula Interface
posthoc.kruskal.nemenyi.test(count ~ spray, data = InsectSprays, dist="Tukey")



