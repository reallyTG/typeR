library(expSBM)


### Name: expSBM_select
### Title: expSBM_select
### Aliases: expSBM_select

### ** Examples

set.seed(1)
data(high_school)
## No test: 
res <- expSBM_select(K_max = 8, N = 327, edgelist = high_school$edgelist, tol = 0.01)
## End(No test)



