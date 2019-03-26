library(MvBinary)


### Name: MvBinaryEstim
### Title: Create an instance of the ['MvBinaryResult'] class
### Aliases: MvBinaryEstim

### ** Examples

# Data loading
data(MvBinaryExample)

# Parameter estimation by the HAC-based algorithm on 2 cores
# where the EM algorithms are initialized 10 times
res.CAH <- MvBinaryEstim(MvBinaryExample, 2, nbinit.EM = 10)

# Parameter estimation for two competing models
res.CAH <- MvBinaryEstim(MvBinaryExample, algorithm="List",
 modelslist=list(c(1,1,2,2,3,4), c(1,1,1,2,2,2)), nbinit.EM = 10)

# Summary of the estimated model
summary(res.CAH)

# Print the parameters of the estimated model
print(res.CAH)



