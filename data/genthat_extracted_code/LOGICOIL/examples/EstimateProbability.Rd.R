library(LOGICOIL)


### Name: EstimateProbability
### Title: Estimate oligomeric state score at each position of the input
###   coiled-coil sequence
### Aliases: EstimateProbability

### ** Examples

# load pssm data
library(nnet)
data(pssm)
data(Model_Parameters)
data(LOGICOILfit)

# priors obtained from LOGICOIL training set
prior <- c(0.6331,0.237,0.053,0.0769)
  
# compute test scores
cat("Estimating oligomeric state of coiled-coil sequences")
prob.oligo <- EstimateProbability("GCN4wt", 
  		"MKQLEDKVEELLSKNYHLENEVARLKKLV", 
			"abcdefgabcdefgabcdefgabcdefga", 
      pssm, 
      LOGICOILfit, 
      Model_Parameters)

# compute final summary probability for whole sequence
score <- apply(prob.oligo, 2, mean) / prior

# print output
print(score)




