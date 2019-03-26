library(PMCMR)


### Name: posthoc.kruskal.conover.test
### Title: Pairwise Test for Multiple Comparisons of Mean Rank Sums
###   (Conover's-Test)
### Aliases: posthoc.kruskal.conover.test
###   posthoc.kruskal.conover.test.default
###   posthoc.kruskal.conover.test.formula
### Keywords: htest nonparametric

### ** Examples

##
require(stats) 
data(InsectSprays)
attach(InsectSprays)
kruskal.test(count, spray)
posthoc.kruskal.conover.test(count, spray, "bonferroni")
detach(InsectSprays)
rm(InsectSprays)
## Formula Interface
posthoc.kruskal.conover.test(count ~ spray, data = InsectSprays, p.adjust="bonf")



