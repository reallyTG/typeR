library(depend.truncation)


### Name: NPMLE.Plackett
### Title: Semiparametric Inference under the Plackett Copula with
###   Dependent Truncation
### Aliases: NPMLE.Plackett
### Keywords: Copula Semiparametric method

### ** Examples

##### Generate truncated data from Plackett copula with unit exponential marginals #####
set.seed(1)
m=25 #### sample size ####
alpha_true=1/5.11 #### Kendall's tau on (X,Y) = 0.5 ####
x.trunc=y.trunc=numeric(m)
l=1
while(l<=m){
  u=runif(1,min=0,max=1)
  v=runif(1,min=0,max=1)
  K=function(w){
    A=sqrt( (1+(alpha_true-1)*(u+w))^2-4*alpha_true*(alpha_true-1)*u*w )  
    2*v+(  1+(alpha_true-1)*u-(alpha_true+1)*w  )/A-1
  }
  low=0.00001*u
  up=1-0.00001*v
  for(j in 1:100){ #### Invert K(.) by the bisection method to ####
    mid=(low+up)/2;M<-K(mid);U<-K(up)
    if(M*U>0){up<-mid}else{low<-mid}
  }
  w=mid
  x=-log(1-u);y=-log(w)
  if((x<y)){
  x.trunc[l]=x;y.trunc[l]=y
  l=l+1
  }
}

NPMLE.Plackett(x.trunc, y.trunc, x.fix =1, y.fix = 1, plotX = TRUE)

#### compare the above estimate with the true value #####
c(alpha_true=alpha_true,Fx_true=1-exp(-1),Sy_true=exp(-1))



