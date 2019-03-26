library(QRegVCM)


### Name: simul_shapetest
### Title: Testing the shape of a functional coefficient in the median
###   and/or the variabilty function
### Aliases: simul_shapetest

### ** Examples

data(wages)
y = wages$resp ## the hourly wage
times = wages$exper ## the duration of work experience in years
subj = wages$id ## subject indicator (individual)
dim=length(y) ## number of rows in the data = 6402
x0 = rep(1,dim) ## for intercept
### the covariates
## creating 2 dummy variables for the race covariate
wages$r1[wages$race=="black"]=1
wages$r1[wages$race!="black"]=0
wages$r2[wages$race=="hisp"]=1
wages$r2[wages$race!="hisp"]=0
x1 = wages$r1 # stands for black
x2 = wages$r2 # stands for hispanic
x3 = wages$hgc ## the highest grade completed by the indiviadual
X = cbind(x0, x1, x2, x3) ## the covariate matrix
px=ncol(X)

##########################
### Input parameters ####
#########################
lambda = 1 # we used 10^seq(-2, 1, 0.1) in Gijbels etal (2017a)
kn = rep(1,px) # used rep(5,px) in Gijbels etal (2017a)
degree = rep(2,px) # the degree of splines
d = rep(1,px)
gam=0.25
nr.bootstrap.samples=2 # used 200 in Gijbels etal (2017a)
seed=110
#########################
test1=simul_shapetest(times=times, subj=subj, X=X, y=y, d=d, kn=kn,
                     degree=degree, lambda=lambda, gam=gam, v=1,
                     nr.bootstrap.samples=nr.bootstrap.samples,seed=seed,
                     test=c("c",NA),omega=10^3)
#### Testing results
test1$result  #the testing procedures
test1$P  ## p-values
test1$R ## test statistics





