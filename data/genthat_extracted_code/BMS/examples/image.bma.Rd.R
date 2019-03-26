library(BMS)


### Name: image.bma
### Title: Plot Signs of Best Models
### Aliases: image.bma
### Keywords: hplot

### ** Examples

 data(datafls)
 
 model=bms(datafls,nmodel=200)
 
 #plot all models
 image(model,order.by.pip=FALSE)
 image(model,order.by.pip=TRUE,cex.axis=.8)
 
 #plot best 7 models, with other colors
 image(model[1:7],yprop2pip=TRUE,col=c("black","lightgrey"))
 



