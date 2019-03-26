library(scaleboot)


### Name: sbaic
### Title: Akaike's Information Criterion
### Aliases: sbaic sbaic<- sbaic.scaleboot sbaic.scalebootv
###   sbaic<-.scaleboot sbaic<-.scalebootv
### Keywords: models

### ** Examples

data(mam15)
a <- mam15.relltest[["t4"]] # an object of class "scaleboot"
sbaic(a) # print AIC for models
sbaic(a,k=log(sum(a$nb))) # print BIC for models
sbaic(a) <- sbaic(a,k=log(sum(a$nb))) # set BIC
sbaic(a) # print BIC for models



