library(AMModels)


### Name: methods-amModel
### Title: Methods For Displaying, Summarizing, And Manipulating 'amModel'
###   And 'amData' Objects
### Aliases: methods-amModel summary,amModel-method
###   [,amModel,ANY,ANY,ANY-method [,amModel-method
###   [[,amModel,ANY,ANY-method [[,amModel-method
###   [<-,amModel,ANY,ANY-method [<-,amModel,ANY,ANY,ANY-method
###   [<-,amModel-method [[<-,amModel,ANY,ANY-method [[<-,amModel-method
###   summary,amData-method summary,amModel-method
###   [,amData,ANY,ANY,ANY-method [,amData-method [[,amData,ANY,ANY-method
###   [[,amData-method [<-,amData,ANY,ANY-method
###   [<-,amData,ANY,ANY,ANY-method [<-,amData-method
###   [[<-,amData,ANY,ANY-method [[<-,amData-method
### Keywords: methods

### ** Examples


# create dataset from lm helpfile
## Annette Dobson (1990) "An Introduction to Generalized Linear Models".
## Page 9: Plant Weight Data.
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)
lm.D90 <- lm(weight ~ group - 1) # omitting intercept


# create am amModel object
full.model <- amModel(
    model = lm.D9, 
    comment = 'full model', 
    source = 'lm helpfile (R).', 
    taxa = 'plants', 
    data = 'plant.data'
)


# create an amData object
plant.data <- data.frame(group = group, weight = weight)
plant.data <- amData(
    data = plant.data, 
    source = 'lm helpfile (R).',
    comment = 'Dataset from lm helpfile.'
)

summary(full.model)

# [ and [[ index from metadata
full.model[c(2,1)]
full.model[[1]]
full.model[['taxa']]

plant.data[c(2,1)]
plant.data[[1]]
plant.data[['comment']]




