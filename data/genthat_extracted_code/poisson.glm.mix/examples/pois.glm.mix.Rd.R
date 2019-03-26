library(poisson.glm.mix)


### Name: pois.glm.mix
### Title: Main call function of the package.
### Aliases: pois.glm.mix

### ** Examples

## load a small dataset of 500 observations
data("simulated_data_15_components_bjk")
## in this example there is V = 1 covariates (x)
##   and d = 6 response variables (y). The design is
##   L = (3,2,1).
V <- 1
x <- array(sim.data[,1],dim=c(dim(sim.data)[1],V))
y <- sim.data[,-1]

## We will run the algorithm using parameterization
##   m = 1 and the number of components in the set
##   {2,3,4}.

rr<-pois.glm.mix(reference=x, response=y, L=c(3,2,1), m=1, 
                  max.iter=1000, Kmin=2, Kmax= 4, 
                  m1=3, m2=3, t1=3, t2=3, msplit=3, tsplit=3,mnr = 5)

# note: useR should specify larger values for Kmax, m1, m2, 
#	t1, t2, msplit and tsplit for a complete analysis.


# retrieve the selected models according to BIC or ICL
rr$sel.mod.icl
rr$sel.mod.bic
# retrieve the estimates according to ICL
# alpha
rr$est.sel.mod.icl$alpha
# beta
rr$est.sel.mod.icl$beta
# gamma
rr$est.sel.mod.icl$gamma
# pi
rr$est.sel.mod.icl$pi
# frequency table with estimated clusters
table(rr$est.sel.mod.icl$clust)
# histogram of the maximum conditional probabilities
hist(apply(rr$est.sel.mod.icl$tau,1,max),30)

##(the full data of 5000 observations can be loaded using 
##     data("simulated_data_15_components_bjk_full")



