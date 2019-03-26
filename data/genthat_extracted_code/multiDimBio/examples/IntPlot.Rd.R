library(multiDimBio)


### Name: IntPlot
### Title: A function to visualize the results of a MANOVA
### Aliases: IntPlot

### ** Examples

data(Scores)
data(CondA)
data(CondB)

pvals<-c(0.03,0.6,0.05,0.07,0.9,0.2,0.5,0.3)
int.pvals<-c(0.3,0.45,0.5,0.12)

IntPlot(Scores,CondA,CondB,pvalues=pvals, int.pvalues=int.pvals)



