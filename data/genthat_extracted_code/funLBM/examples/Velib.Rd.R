library(funLBM)


### Name: Velib
### Title: The Velib data set.
### Aliases: Velib
### Keywords: datasets

### ** Examples

data(Velib)
## No test: 
# Co-clustering
out = funLBM(Velib$data,K=4,L=2)

# Visualization of results
plot(out,type='blocks')
plot(out,type='proportions')
plot(out,type='means')
## End(No test)



