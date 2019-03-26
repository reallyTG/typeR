library(scaleboot)


### Name: sbconf
### Title: Bootstrap Confidence Intervals
### Aliases: sbconf sbconf.default sbconf.sbconf print.sbconf plot.sbconf
### Keywords: nonparametric

### ** Examples

## An example to calculate confidence intervals
## The test statistic is that for "t4" in data(mam15)

data(mam15) # load mam15.mt
sa <- 10^seq(-2,2,length=13) # parameter for multiscale bootstrap

## Definition of a test statistic of interest.
## "myfun" returns the maximum difference of log-likelihood value
## for a tree named a.
myfun <- function(x,w,a) maxdif(wsumrow(x,w))[[a]]
maxdif <- function(x) {
  i1 <- which.max(x)  # the largest element
  x <- -x + x[i1]
  x[i1] <- -min(x[-i1])  # the second largest value
  x
}
wsumrow <- function(x,w) {
  apply(w*x,2,sum)*nrow(x)/sum(w)
}

## Not run: 
##D ## a quick example with nb=1000 (fairely fast in 2017)
##D ## Compute multiscale bootstrap replicates
##D nb <- 1000 # nb = 10000 is better but slower
##D # the following line takes some time (less than 1 minute in 2017)
##D sim <- scaleboot(mam15.mt,nb,sa,myfun,"t4",count=FALSE,onlyboot=TRUE)
##D 
##D ## show 90##D 
##D ## each tail is also interpreted as 95##D 
##D (conf1 <- sbconf(sim$stat,sim$sa,model="sing.3",k=1)) # with k=1
##D (conf2 <- sbconf(conf1,model="sing.3",k=2)) # with k=2
##D (conf3 <- sbconf(conf2,model="sing.3",k=3)) # with k=3
##D 
##D ## plot diagnostics for computing the confidence limits
##D plot(conf3) # AIC values for models v.s. test statistic value
##D plot(conf3,yval="zval",type="l") # corrected "k.3" z-value
## End(Not run)


## Not run: 
##D ## a longer example with nb=10000 (it was slow in 2010)
##D ## In the following, we used 40 cpu's.
##D nb <- 10000
##D 
##D library(parallel)
##D cl <- makeCluster(40)
##D clusterExport(cl,c("maxdif","wsumrow"))
##D 
##D ## Compute multiscale bootstrap replicates
##D ## (It took 80 secs using 40 cpu's)
##D sim <- scaleboot(mam15.mt,nb,sa,myfun,"t4",count=FALSE,
##D                  cluster=cl,onlyboot=TRUE)
##D 
##D ## Modify option "probs0" to a fine grid with 400 points
##D ## default: 0.001 0.010 0.100 0.900 0.990 0.999
##D ## NOTE: This modification is useful only when cl != NULL,
##D ##   in which case calls to sbfit for the grid points
##D ##   are made in parallel, although iterations seen later
##D ##   are made sequentially.
##D sboptions("probs0",pnorm(seq(qnorm(0.001),qnorm(0.999),length=400)))
##D 
##D ## Calculate bootstrap confidence intervals using "k.1" p-value.
##D ## (It took 70 secs using 40 cpu's)
##D ## First, sbfit is applied to bp's determined by option "probs0"
##D ## Then, additional fitting is made only twice for iteration.
##D ## p[1]=0.05 iter=1 t=4.342723 e=0.0003473446 r=0.0301812
##D ## p[2]=0.95 iter=1 t=42.76558 e=0.002572495 r=0.1896809
##D conf1 <- sbconf(sim$stat,sim$sa,model="sing.3",k=1,cluster=cl)
##D 
##D ## The confidence interval with "k.1" is printed as
##D ##     0.05      0.95 
##D ## 4.342723 42.765582 
##D conf1 
##D 
##D ## Calculate bootstrap confidence intervals
##D ##                        using "k.2" and "k.3" p-values.
##D ## (It took only 10 secs)
##D ## p[1]=0.05 iter=1 t=-2.974480 e=0.003729190 r=0.04725755
##D ## p[2]=0.95 iter=1 t=39.51767 e=0.001030929 r=0.06141937
##D ##      0.05      0.95 
##D ## -2.974480 39.517671 
##D conf2 <- sbconf(conf1,model="sing.3",k=2)
##D conf2
##D ## p[1]=0.05 iter=1 t=-3.810157 e=0.01068678 r=0.08793868
##D ## p[2]=0.95 iter=1 t=39.32669 e=0.001711107 r=0.09464663
##D ##      0.05      0.95 
##D ## -3.810157 39.326686 
##D conf3 <- sbconf(conf2,model="sing.3",k=3)
##D conf3
##D 
##D ## plot diagnostics
##D plot(conf3) # AIC values for models v.s. test statistic value
##D plot(conf3,yval="zval",type="l") # corrected "k.3" z-value
##D 
##D stopCluster(cl)
## End(Not run)




