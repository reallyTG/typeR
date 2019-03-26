library(AMModels)


### Name: insertAMModelLib
### Title: Insert Model Of Class 'amModel' Or Dataset Of Class 'amData'
###   Into An 'amModelLib' Object
### Aliases: insertAMModelLib
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

# create an amData object that includes metadata
plant.data <- data.frame(group = group, weight = weight)
plant.data <- amData(data = plant.data, comment = 'Dataset from lm helpfile.')

# create an amModel object with metadata and a soft link to the data
full.model <- amModel(
    model = lm.D9, 
    comment = 'full model', 
    source = 'lm helpfile (R).', 
    taxa = 'plants', 
    data = 'plant.data'
)


# create an amModelLib that contains the amModel object and the amData object
# the model and data must be supplied as named lists
mymodels <- amModelLib(
    description = "An example amModelLib.",
    models = list(full.model = full.model), 
    data = list(plant.data = plant.data)
)
 
# create second amModel object with metadata and a soft link to the same data
no.int.model <- amModel(
    model = lm.D90, 
    comment = 'model without intercept', 
    source = 'lm helpfile (R).', 
    taxa = 'plants', 
    data = 'plant.data'
)

# create a second amData object 
log.plant.data <- data.frame(group, log.weight=log(weight))
log.plant.data <- amData(
    data = log.plant.data, 
    comment = 'data to fit log model', 
    source = 'lm helpfile (R).'
)

# insert the second model and second dataset to the amModelLib
mymodels <- insertAMModelLib(
    mymodels, 
    models = list(no.int.model = no.int.model),
    data = list(log.plant.data = log.plant.data)
)




