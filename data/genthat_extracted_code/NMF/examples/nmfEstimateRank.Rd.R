library(NMF)


### Name: nmfEstimateRank
### Title: Estimate Rank for NMF Models
### Aliases: nmfEstimateRank plot.NMF.rank

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

if( !isCHECK() ){

set.seed(123456)
n <- 50; r <- 3; m <- 20
V <- syntheticNMF(n, r, m)

# Use a seed that will be set before each first run
res <- nmfEstimateRank(V, seq(2,5), method='brunet', nrun=10, seed=123456)
# or equivalently
res <- nmf(V, seq(2,5), method='brunet', nrun=10, seed=123456)

# plot all the measures
plot(res)
# or only one: e.g. the cophenetic correlation coefficient
plot(res, 'cophenetic')

# run same estimation on randomized data
rV <- randomize(V)
rand <- nmfEstimateRank(rV, seq(2,5), method='brunet', nrun=10, seed=123456)
plot(res, rand)
}



