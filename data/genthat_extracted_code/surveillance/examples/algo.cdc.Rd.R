library(surveillance)


### Name: algo.cdc
### Title: The CDC Algorithm
### Aliases: algo.cdcLatestTimepoint algo.cdc
### Keywords: classif

### ** Examples

# Create a test object
disProgObj <- sim.pointSource(p = 0.99, r = 0.5, length = 500, 
                              A = 1,alpha = 1, beta = 0, phi = 0,
                              frequency = 1, state = NULL, K = 1.7)

# Test week 200 to 208 for outbreaks with a selfdefined cdc
algo.cdc(disProgObj, control = list(range = 400:500,alpha=0.025))



