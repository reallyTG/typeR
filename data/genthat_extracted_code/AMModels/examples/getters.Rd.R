library(AMModels)


### Name: getters
### Title: Extract A Single Model or Data Object, Get Or Set Info,
###   Description, Or Metadata.
### Aliases: getters getAMModel getAMData ammlDesc ammlInfo getAMData
###   ammlDesc ammlDesc<- ammlInfo ammlInfo<- modelMeta modelMeta<-
###   dataMeta dataMeta<-
### Keywords: utilities

### ** Examples


# create dataset from lm helpfile
## Annette Dobson (1990) "An Introduction to Generalized Linear Models".
## Page 9: Plant Weight Data.
# notice the models lm.D9 and lm.D90 are of class 'lm'
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)
lm.D90 <- lm(weight ~ group - 1) # omitting intercept


# create two amModel objects with metadata and a soft link to the data
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

# create an amData object that includes metadata
# the plant.data is of class data.frame
plant.data <- data.frame(group = group, weight = weight)
plant.data <- amData(
    data = plant.data, 
    comment = 'Dataset from lm helpfile.'
)

# create a second amData object that includes metadata
log.plant.data <- data.frame(group, log.weight=log(weight))
log.plant.data <- amData(
    data = log.plant.data, 
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
    data = list(
        plant.data = plant.data, 
        log.plant.data = log.plant.data
    )
)

# extract the dataset
getAMData(amml = mymodels, 'plant.data', as.list = FALSE)

# you can also extract by index
getAMData(amml = mymodels, 1, as.list = FALSE)

# extract the model
getAMModel(amml = mymodels, 'full.model', as.list = FALSE)

# you can also extract by index
getAMModel(amml = mymodels, 1, as.list = FALSE)
 
# extraction with '[' and '[[', which are identical here, focus on models
mymodels[c(1,2)]
mymodels[[1]]

# Add a description to the amModelLib
ammlDesc(mymodels) <- "This library demonstrates how to store models 
and data in a format that allows for descriptive metadata and easy 
retrieval for future reference."

# Extract the description
ammlDesc(mymodels)

# Add some metadata 'info' to the amModelLib
ammlInfo(mymodels) <- list(owner = 'me', organization = 'My Organization')

# Extract all info for an amModelLib
ammlInfo(mymodels) 

# Extract targeted info
ammlInfo(amml = mymodels, 'owner')

# Delete metadata by setting to NULL
ammlInfo(mymodels) <- list(organization = NULL)

# Extract all model metadata
modelMeta(mymodels)

# Extract metadata from specific model
modelMeta(amml = mymodels, 'full.model')

# Add metadata to 'full.model'
modelMeta(amml = mymodels, 'full.model') <- list(
    url = "https://stat.ethz.ch/R-manual/R-devel/library/stats/html/lm.html"
)

# remove metadata by setting value to NULL
modelMeta(amml = mymodels, 'full.model') <- list(url = NULL)

# Extract all data metadata
dataMeta(mymodels)

# Extract metadata from specific data
dataMeta(amml = mymodels, 'plant.data')

# Add metadata to 'plant.data'
dataMeta(mymodels, 'plant.data') <- list(
    url = "https://stat.ethz.ch/R-manual/R-devel/library/stats/html/lm.html"
)

# remove metadata by setting value to NULL
dataMeta(mymodels, 'plant.data') <- list(url = NULL)




