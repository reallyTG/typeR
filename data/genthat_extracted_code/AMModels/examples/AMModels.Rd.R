library(AMModels)


### Name: AMModels
### Title: Search for a model in a model list using 'grep'
### Aliases: AMModels
### Keywords: package

### ** Examples


# create data and linear models from from lm helpfile
## Annette Dobson (1990) "An Introduction to Generalized Linear Models".
## Page 9: Plant Weight Data.
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)
lm.D90 <- lm(weight ~ group - 1) # omitting intercept

# create an amData object that includes metadata
plant.data <- data.frame(group = group, weight = weight)
plant.data <- amData(
    data = plant.data, 
    comment = 'Dataset from lm helpfile.'
)

# create a second amData object that includes metadata
log.plant.data <- data.frame(group, log.weight = log(weight))
log.plant.data <- amData(
    data = log.plant.data, 
    comment = 'data with log weight', 
    source = 'lm helpfile (R).'
)

# create two amModel objects with metadata and the metadata keyword 'data' to soft 
# link the data used to fit the models
full.model <- amModel(
    model = lm.D9, 
    comment = 'full model', 
    source = 'lm helpfile (R).', 
    taxa = 'plants', 
    data = 'plant.data'
)

no.int.model <- amModel(
    model = lm.D90, 
    comment = 'model without intercept', 
    source = 'lm helpfile (R).', 
    taxa = 'plants', 
    data = 'plant.data'
)

# create an amModelLib that contains the two amModel objects and two amData objects
# the models and data must be supplied as named lists
mymodels <- amModelLib(
    models = list(
        full.model = full.model, 
        no.int.model = no.int.model
    ), 
    data = list(
        plant.data = plant.data, 
        log.plant.data = log.plant.data
    )
)

# show the amModelLib
mymodels

# search the entire amModelLib for the word 'intercept'
# the dataset associated with the model will be returned
grepAMModelLib(pattern = "intercept", amml = mymodels)   
 
# search for data containing the word 'log'
grepAMModelLib(pattern = "log", amml = mymodels, search = "data") 

# search for models containing the word 'full';
# because 'full.model' is soft-linked to a dataset, 
# the dataset information will be returned.
grepAMModelLib(pattern = "full", amml = mymodels, search = "model") 


# list names of models in an amModelLib
lsModels(mymodels)

# list names of data in an amModelLib
lsData(mymodels)
 
# extract the dataset by name
getAMData(amml = mymodels, 'plant.data', as.list = FALSE)

# notice the data are returned in their original class
class(getAMData(amml = mymodels, 'plant.data', as.list = FALSE))

# you can also extract by index
getAMData(amml = mymodels, 1, as.list = FALSE)

# extract the model by name
getAMModel(amml = mymodels, 'full.model', as.list = FALSE)

# notice the models are returned in their original class
class(getAMModel(amml = mymodels, 'full.model', as.list = FALSE))
  
# you can also extract by index
getAMModel(amml = mymodels, 1, as.list = FALSE)

# remove just the second model
rmModel(mymodels, 'no.int.model')

# remove the first plant data
# notice a warning is produced because some amModels are softly linked
# to the dataset via the metadata keyword, 'data'
rmData(mymodels, 'plant.data')

## Not run: 
##D  
##D # The shiny app
##D modelMgr()
## End(Not run)



