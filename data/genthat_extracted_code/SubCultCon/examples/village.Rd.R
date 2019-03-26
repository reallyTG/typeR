library(SubCultCon)


### Name: village
### Title: Sahariya Village Quality
### Aliases: village
### Keywords: datasets

### ** Examples

data(village)
village$questions
##
# uncomment to do an hypothesis test of H_0: same answer key for both villages, versus
#                                            H_1: villages have different answer keys
#ans=ccgrouptest(village$answermat,village$group) ## takes a few minutes to simulate distribution
#par(mar=c(3,4,3,1))
#hist(ans$simdist,br=0:50/50*(ans$diff-min(ans$simdist))+min(ans$simdist),
#main="simulated distribution of test statistic
#observed value is X")
#points(ans$diff,0,pch="X",cex=1.2,col=2)
#ans$pval  # the computed p-value is zero because the observed test statistic 
#                  #  is larger than all simulated values



