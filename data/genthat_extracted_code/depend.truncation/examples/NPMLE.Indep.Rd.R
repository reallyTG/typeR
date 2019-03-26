library(depend.truncation)


### Name: NPMLE.Indep
### Title: Semiparametric Inference under the Independence Copula with
###   Dependent Truncation
### Aliases: NPMLE.Indep
### Keywords: Copula Semiparametric method

### ** Examples

##### Generate independent truncated data with unit exponential marginals #####
set.seed(1)
m=35 #### sample size ####
x.trunc=y.trunc=numeric(m)
l=1
while(l<=m){
  x=rexp(1,rate=1)
  y=rexp(1,rate=1)
  if((x<y)){
  x.trunc[l]=x;y.trunc[l]=y
  l=l+1
  }
}

NPMLE.Indep(x.trunc, y.trunc, x.fix =1, y.fix = 1, plotX = TRUE)

#### compare the above estimate with the true value #####
c(Fx_true=1-exp(-1),Sy_true=exp(-1))



