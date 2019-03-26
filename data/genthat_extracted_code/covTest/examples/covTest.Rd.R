library(covTest)


### Name: covTest
### Title: Compute the covariance test for adaptive linear modelling
### Aliases: covTest
### Keywords: lasso least angle regression adaptive fitting

### ** Examples



set.seed(1234)
x=matrix(rnorm(100*10),ncol=10)
x=scale(x,TRUE,TRUE)/sqrt(99)
beta=c(4,rep(0,9))
y=x%*%beta+.4*rnorm(100)

#Gaussian
a=lars(x,y)
covTest(a,x,y)

#EN
a=lars.en(x,y,lambda2=1)
covTest(a,x,y)

#logistic
y=1*(y>0)

a=lars.glm(x,y,family="binomial")
covTest(a,x,y)


# Cox model
#y=6*x[,2]+rnorm(100)+10
#status=sample(c(0,1),size=length(y),replace=TRUE)
#a=lars.glm(x,y,status=status,family="cox")
#covTest(a,x,y,status=status)



