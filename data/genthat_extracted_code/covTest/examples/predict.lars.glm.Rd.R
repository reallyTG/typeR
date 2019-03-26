library(covTest)


### Name: predict.lars.glm
### Title: Function to make predictions from lars.glm fit
### Aliases: predict.lars.glm
### Keywords: LARS lasso logistic Cox model

### ** Examples

#logistic
x=matrix(rnorm(100*10),ncol=10)
x=scale(x,TRUE,TRUE)/sqrt(99)
y=4*x[,2]+rnorm(100)
y=1*(y>0)
a=lars.glm(x,y,family="binomial")
yhat=predict.lars.glm(a,x,family="binomial")

# Cox model
#y=6*x[,2]+rnorm(100)+10
#status=sample(c(0,1),size=length(y),replace=TRUE)
#a=lars.glm(x,y,status=status,family="cox")
#yhat=predict.lars.glm(a,x,family="cox")



