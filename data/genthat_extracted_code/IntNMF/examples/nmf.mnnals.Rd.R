library(IntNMF)


### Name: nmf.mnnals
### Title: Nonnegative Matrix Factorization of Multiple data using
###   Nonnegative Alternating Least Square
### Aliases: nmf.mnnals
### Keywords: ~kwd1 ~kwd2

### ** Examples

#### Simulation of three interrelated dataset
#prop <- c(0.65,0.35)
#prop <- c(0.30,0.40,0.30)
prop <- c(0.20,0.30,0.27,0.23)
effect <- 2.5

library(InterSIM)
sim.D <- InterSIM(n.sample=100, cluster.sample.prop=prop, delta.methyl=effect,
delta.expr=effect, delta.protein=effect, p.DMP=0.25, p.DEG=NULL, p.DEP=NULL,
do.plot=FALSE, sample.cluster=TRUE, feature.cluster=TRUE)
dat1 <- sim.D$dat.methyl
dat2 <- sim.D$dat.expr
dat3 <- sim.D$dat.protein
true.cluster.assignment <- sim.D$clustering.assignment

## Make all data positive by shifting to positive direction.
## Also rescale the datasets so that they are comparable.
if (!all(dat1>=0)) dat1 <- pmax(dat1 + abs(min(dat1)), .Machine$double.eps)
dat1 <- dat1/max(dat1)
if (!all(dat2>=0)) dat2 <- pmax(dat2 + abs(min(dat2)), .Machine$double.eps)
dat2 <- dat2/max(dat2)
if (!all(dat3>=0)) dat3 <- pmax(dat3 + abs(min(dat3)), .Machine$double.eps)
dat3 <- dat3/max(dat3)
# The function nmf.mnnals requires the samples to be on rows and variables on columns.
dat1[1:5,1:5]
dat2[1:5,1:5]
dat3[1:5,1:5]
dat <- list(dat1,dat2,dat3)

# Find optimum number of clusters for the data
#opt.k <- nmf.opt.k(dat=dat, n.runs=5, n.fold=5, k.range=2:7, result=TRUE,
#make.plot=TRUE, progress=TRUE)
# Find clustering assignment for the samples
fit <- nmf.mnnals(dat=dat, k=length(prop), maxiter=200, st.count=20, n.ini=15,
ini.nndsvd=TRUE, seed=TRUE)
table(fit$clusters)
fit$clusters[1:10]



