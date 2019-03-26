library(TopKLists)


### Name: MC
### Title: Markov chain based rank aggregation
### Aliases: MC

### ** Examples

#get sample data
data(TopKSpaceSampleInput)
outMC=MC(input,space) #underlying space-dependent
outMCa=MC(input,space=input) #top-k spaces
MC.plot(outMC)



