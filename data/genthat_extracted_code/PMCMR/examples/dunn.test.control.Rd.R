library(PMCMR)


### Name: dunn.test.control
### Title: Pairwise Test for Multiple Comparisons of Mean Rank Sums with
###   one control (Dunn's-Test)
### Aliases: dunn.test.control
### Keywords: htest nonparametric

### ** Examples

##
require(stats) 
data(PlantGrowth)
attach(PlantGrowth)
kruskal.test(weight, group)
dunn.test.control(weight,group, "bonferroni")
detach(PlantGrowth)
rm(PlantGrowth)



