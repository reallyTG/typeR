library(TopKLists)


### Name: Kendall.plot
### Title: Plot of the Kendall Criterion values
### Aliases: Kendall.plot

### ** Examples

#get sample data
data(TopKSpaceSampleInput)
outMC=MC(input,space)
all.aggregate=list(outMC$MC1.TopK,outMC$MC2.TopK,outMC$MC3.TopK)
Kendall.plot(input, all.aggregate,space, algorithm=c("MC1","MC2","MC3"))



