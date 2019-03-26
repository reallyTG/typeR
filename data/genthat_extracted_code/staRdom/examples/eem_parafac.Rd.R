library(staRdom)


### Name: eem_parafac
### Title: Runs a PARAFAC analysis on EEM data
### Aliases: eem_parafac

### ** Examples

## No test: 
data(eem_list)

dim_min <- 3 # minimum number of components
dim_max <- 7 # maximum number of components
nstart <- 10 # random starts for PARAFAC analysis, models built simulanuously, best selected
cores <- parallel::detectCores()/2 # use all cores but do not use all threads
maxit = 500
ctol <- 10^-4 # tolerance for parafac

pfres_comps <- eem_parafac(eem_list,comps=seq(dim_min,dim_max),
    normalise = TRUE,maxit=10000,nstart=nstart,ctol=ctol,cores=cores)
## End(No test)



