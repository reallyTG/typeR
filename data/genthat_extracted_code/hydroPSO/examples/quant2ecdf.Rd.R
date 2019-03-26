library(hydroPSO)


### Name: quant2ecdf
### Title: Simulated Values -> Empirical CDFs
### Aliases: quant2ecdf quant2ecdf.default quant2ecdf.matrix
###   quant2ecdf.data.frame
### Keywords: math manip graph

### ** Examples

# random matrix with 100 simulated values (in columns) corresponding to 10
# different behavioural parameter sets
x <- matrix(rnorm(1000), ncol=10, nrow=100)

# empirical CDFs for the quantiles 0.05, 0.5 and 0.95, with equal weight for 
# each parameter set
quant2ecdf(sim=x, weights=1:10, byrow=FALSE) 



