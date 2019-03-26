library(remote)


### Name: predict
### Title: EOT based spatial prediction
### Aliases: predict predict,EotMode-method predict,EotStack-method

### ** Examples

### not very useful, but highlights the workflow
data(pacificSST)
data(australiaGPCP)

## train data using eot()
train <- eot(x = pacificSST[[1:10]], 
             y = australiaGPCP[[1:10]], 
             n = 1)

## predict using identified model
pred <- predict(train, 
                newdata = pacificSST[[11:20]], 
                n = 1)

## compare results
opar <- par(mfrow = c(1,2))
plot(australiaGPCP[[13]], main = "original", zlim = c(0, 10))
plot(pred[[3]], main = "predicted", zlim = c(0, 10))
par(opar)




