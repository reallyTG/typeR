library(MCPMod)


### Name: genDFdata
### Title: Simulate dose-response data
### Aliases: genDFdata
### Keywords: datagen

### ** Examples

# use emax model
genDFdata("emax", c(e0 = 0.2, eMax = 1, ed50 = 0.05), c(0,0.05,0.2,0.6,1), 20, 1)
# use fixed mean vector
genDFdata(mu = 1:5, doses = 0:4, n = c(20, 20, 10, 5, 1), sigma = 0.2)



