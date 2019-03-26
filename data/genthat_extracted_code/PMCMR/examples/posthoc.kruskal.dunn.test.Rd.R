library(PMCMR)


### Name: posthoc.kruskal.dunn.test
### Title: Pairwise Test for Multiple Comparisons of Mean Rank Sums
###   (Dunn's-Test)
### Aliases: posthoc.kruskal.dunn.test posthoc.kruskal.dunn.test.default
###   posthoc.kruskal.dunn.test.formula
### Keywords: htest nonparametric

### ** Examples

##
require(stats) 
data(InsectSprays)
attach(InsectSprays)
kruskal.test(count, spray)
posthoc.kruskal.dunn.test(count, spray, "bonferroni")
detach(InsectSprays)
rm(InsectSprays)
## Formula Interface
posthoc.kruskal.dunn.test(count ~ spray, data = InsectSprays, p.adjust="bonf")



