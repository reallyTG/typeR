library(BigVAR)


### Name: predict
### Title: Forecast using a BigVAR.results object
### Aliases: predict predict,BigVAR.results-method

### ** Examples

data(Y)
Y=Y[1:100,]
Model1=constructModel(Y,p=4,struct="Basic",gran=c(50,10),verbose=FALSE)
results=cv.BigVAR(Model1)
predict(results,n.ahead=1)



