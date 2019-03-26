library(depend.truncation)


### Name: centenarian
### Title: Japanese Centenarians Data
### Aliases: centenarian
### Keywords: datasets

### ** Examples

## Below is the centenarians data analysis of Emura & Murotani (2015) ##
data(centenarian)
Death=centenarian[,1]
Year=1963:1980
data.mat=centenarian[,-1]

X=T=NULL
for(i in 1:length(Death)){
  for(j in 1:length(Year)){
    X=c( X,rep(Death[i],data.mat[i,j]) )
    T=c( T,rep(Year[j]-i+1,data.mat[i,j]) )  ### T= Year at age 100.5 ###    
  }
}

x.trunc=X
z.trunc=max(Year)+0.5-T+100

m=length(x.trunc)
d=rep(1,m)

set.seed(1)
x.trunc=x.trunc+runif(length(x.trunc),min=-0.01,max=0)
z.trunc=z.trunc+runif(length(z.trunc),min=0,max=0.01)

### Copula-based estimator ####
## CHAIEB.Frank(x.trunc, z.trunc, d, a = 1/10)



