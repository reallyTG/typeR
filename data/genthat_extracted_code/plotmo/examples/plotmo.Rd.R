library(plotmo)


### Name: plotmo
### Title: Plot a model's response over a range of predictor values (the
###   model surface)
### Aliases: plotmo
### Keywords: partial dependence regression

### ** Examples

if (require(rpart)) {
    data(kyphosis)
    rpart.model <- rpart(Kyphosis~., data=kyphosis)
    plotmo(rpart.model, type="prob", nresponse="present")
}
if (require(earth)) {
    data(ozone1)
    earth.model <- earth(O3 ~ ., data=ozone1, degree=2)
    plotmo(earth.model)
    # plotmo(earth.model, pmethod="partdep") # partial dependence plots
}



