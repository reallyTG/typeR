library(pmml)


### Name: pmml.cv.glmnet
### Title: Generate PMML for glmnet objects
### Aliases: pmml.cv.glmnet

### ** Examples


library(glmnet)

# create a simple predictor (x) and response(y) matrices
x=matrix(rnorm(100*20),100,20)
y=rnorm(100)

# Build a simple gaussian model
model1 = cv.glmnet(x,y)
# Output the model in PMML format
pmml(model1)

# shift y between 0 and 1 to create a poisson response
y = y - min(y)
# give the predictor variables names (default values are V1,V2,...)
name <- NULL
for(i in 1:20){
  name <- c(name,paste("variable",i,sep=""))
}
colnames(x) <- name
# create a simple poisson model
model2 <- cv.glmnet(x,y,family="poisson")
# output in PMML format the regression model at the lambda 
# parameter = 0.006
pmml(model2,s=0.006)




