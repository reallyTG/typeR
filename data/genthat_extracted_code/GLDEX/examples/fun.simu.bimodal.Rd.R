library(GLDEX)


### Name: fun.simu.bimodal
### Title: Simulate a mixture of two generalised lambda distributions.
### Aliases: fun.simu.bimodal
### Keywords: datagen

### ** Examples

# Generate random observations from FMKL generalised lambda distributions with 
# parameters (1,2,3,4) and (4,3,2,1) with 50% of data from each distribution.
junk<-fun.simu.bimodal(c(1,2,3,4),c(4,3,2,1),prop1=0.5,param1="fmkl",
param2="fmkl")

# Calculate the maximum number from each simulation run
sapply(junk,max)

# Calculate the median from each simulation run
sapply(junk,median)



