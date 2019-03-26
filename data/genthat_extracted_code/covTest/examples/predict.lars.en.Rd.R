library(covTest)


### Name: predict.lars.en
### Title: Function to make predictions from lars.en fit
### Aliases: predict.lars.en
### Keywords: LARS lasso elastic net

### ** Examples

x=matrix(rnorm(100*10),ncol=10)
x=scale(x,TRUE,TRUE)/sqrt(99)
y=4*x[,2]+rnorm(100)
a=lars.en(x,y,lambda2=1)
yhat=predict.lars.en(a,x,.5)



