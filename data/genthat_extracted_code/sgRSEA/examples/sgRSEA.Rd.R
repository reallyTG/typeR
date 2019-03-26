library(sgRSEA)


### Name: sgRSEA
### Title: Perform a permutation test which computes gene scores and their
###   significance
### Aliases: sgRSEA

### ** Examples

data(melanoma808)
dat = UQnormalize(melanoma808, trt=c('PLX7_R1','PLX7_R2'), ctrl=c('D7_R1','D7_R2'))
results = sgRSEA(dat=dat, multiplier=30)
##	To see the top 10 genes with positive/negative treatment effect
results$gene.pos[1:10,]
results$gene.neg[1:10,]

##	histograms of permutation and observed gene scores
##	plotNScores(results)
##	plotScores(results, m=8)



