library(plsdof)


### Name: pcr.cv
### Title: Model selection for Princinpal Components regression based on
###   cross-validation
### Aliases: pcr.cv
### Keywords: multivariate

### ** Examples

n<-500 # number of observations
p<-5 # number of variables
X<-matrix(rnorm(n*p),ncol=p)
y<-rnorm(n)

# compute PCR 
pcr.object<-pcr.cv(X,y,scale=FALSE,m=3)
pcr.object1<-pcr.cv(X,y,groups=sample(c(1,2,3),n,replace=TRUE),m=3)



