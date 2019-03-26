library(AMModels)


### Name: grepAMModelLib
### Title: Search For A Model In A Model List Using 'grep'
### Aliases: grepAMModelLib
### Keywords: manip

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


# create two amModel objects with metadata and a soft link to the data
full.model <- amModel(
    lm.D9, 
    comment = 'full model', 
    source = 'lm helpfile (R).', 
    taxa = 'plants', 
    data = 'plant.data'
)

no.int.model <- amModel(
    lm.D90, 
    comment = 'model without intercept', 
    source = 'lm helpfile (R).', 
    taxa = 'plants', 
    data = 'plant.data'
)


# create an amData object that includes metadata
plant.data <- data.frame(group = group, weight = weight)
plant.data <- amData(
    plant.data, 
    comment = 'Dataset from lm helpfile.'
)

log.plant.data <- data.frame(group, log.weight=log(weight))
log.plant.data <- amData(
    log.plant.data, 
    comment = 'data to fit log model', 
    source = 'lm helpfile (R).'
)

# create an amModelLib that contains the two amModel objects and two amData objects
# the models and data must be supplied as named lists
mymodels <- amModelLib(
    models = list(
        full.model = full.model, 
        no.int.model = no.int.model
    ), 
    data=list(
        plant.data = plant.data, 
        log.plant.data = log.plant.data
    )
)


# search the entire amModelLib for the word 'intercept'
# the dataset associated with the model will be returned
grepAMModelLib("intercept", amml = mymodels) 

# the class of returned search is an amModelLib object
class(grepAMModelLib("intercept", amml = mymodels))  
 
# search for data containing the word 'log'
grepAMModelLib("log", amml = mymodels, search = "data") 

# search for models containing the word 'full'
# Because 'full.model' is soft-linked to a dataset, 
# the dataset information will be returned.
grepAMModelLib("full", amml = mymodels, search = "model") 

  



