library(DoubleExpSeq)


### Name: optimPlot
### Title: Plot the WEB-Seq Maximum Likelihood Solution for the Weight
###   Parameter in the Weighted Likelihood
### Aliases: optimPlot

### ** Examples

data(exon)
# If all groups were used to estimate dispersions
  optimPlot(counts, offsets, groups) 
# If only the 2 groups being compared were used to estimate dispersions
  optimPlot(counts, offsets, groups, contrast=c(1,3), use.all.groups=FALSE) 



