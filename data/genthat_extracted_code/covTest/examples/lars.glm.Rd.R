library(covTest)


### Name: lars.glm
### Title: Function to fit least angle regression path of solution for
###   Ll-penalized (lasso) logistic regression and the Cox proportional
###   hazards model.
### Aliases: lars.glm
### Keywords: LARS lasso logistic Cox model

### ** Examples

x=matrix(rnorm(100*10),ncol=10)
x=scale(x,TRUE,TRUE)/sqrt(99)

#logistic
y=5*x[,2]+rnorm(100)
y=1*(y>0)
a=lars.glm(x,y,family="binomial")


# Cox model
y=6*x[,2]+rnorm(100)+10
status=sample(c(0,1),size=length(y),replace=TRUE)
a=lars.glm(x,y,status=status,family="cox")
  


