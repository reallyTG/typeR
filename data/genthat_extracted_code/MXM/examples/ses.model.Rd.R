library(MXM)


### Name: Regression models based on SES and MMPC outputs
### Title: Regression model(s) obtained from SES or MMPC
### Aliases: ses.model mmpc.model waldses.model waldmmpc.model
### Keywords: Regression modelling

### ** Examples

# simulate a dataset with continuous data
dataset <- matrix(runif(1000 * 101, 1, 100), nrow = 1000 ) 
#the target feature is the last column of the dataset as a vector
target <- dataset[, 101]
dataset <- dataset[, -101]
sesObject <- SES(target , dataset , max_k=3 , threshold = 0.05);
ses.model(target, dataset, sesObject = sesObject, nsignat = 1, test = NULL) 
ses.model(target, dataset, sesObject = sesObject, nsignat = 40, test = NULL)
mmpcObject <- MMPC(target , dataset , max_k=3 , threshold = 0.05);
mmpc.model(target, dataset, mmpcObject = mmpcObject, test = NULL) 



