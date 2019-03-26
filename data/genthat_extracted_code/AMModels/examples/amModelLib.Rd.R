library(AMModels)


### Name: amModelLib
### Title: Create An 'AMModelLib' Object That Stores Lists Of 'amModel' And
###   'amData' Objects
### Aliases: amModelLib amModelLib-class
### Keywords: classes manip

### ** Examples



# code from the lm helpfile
## Annette Dobson (1990) "An Introduction to Generalized Linear Models".
## Page 9: Plant Weight Data.
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)
lm.D90 <- lm(weight ~ group - 1) # omitting intercept

# create a data.frame of the plant data
plant.data <- data.frame(group = group, weight = weight)

# create an amData object that includes the data.frame and metadata 
plant.data <- amData(
    data = plant.data, 
    comment = 'Dataset from lm helpfile.'
)

# create an amModel model object that includes model lm.D9 and metadata
# use the metadata keyword 'data' to link the model with the amData object 
# that produced it
plant.model1 <- amModel(
    model = lm.D9, 
    comment = 'Example model produced from from lm helpfile.',
    data = 'plant.data'
)

# create a second amModel model object that includes model lm.D90 and metadata
# use the metadata keyword 'data' to soft link the model with its data
plant.model2 <- amModel(
    model = lm.D90, 
    comment = 'Second model produced from from lm helpfile.',
    data = 'plant.data'
)


# use the amModelLib function to create a new amModelLib containing the two
# amModel objects and one amData object
mymodels <- amModelLib(
     models = list(
        plant.model1 = plant.model1,
        plant.model2 = plant.model2
    ), 
    data = list(
        plant.data = plant.data
    ), 
    description = "This amModelLib stores models and data from the lm helpfile.",
    info = list(
        owner = "Me"
    )
)

# use the amModelLib function amModelLib to create an empty amModelLib called mymodels2
mymodels2 <- amModelLib(
     description = "A second amModelLib called mymodels2.", 
     info = list(
         owner = "Me2"
     )
)

# use the insertAMModelLib function to insert the two amModel objects and one 
# amData oject to the existing amModelLib
mymodels2 <- insertAMModelLib(
     models = list(
         plant.model1 = plant.model1, 
         plant.model2 = plant.model2), 
     data = list(plant.data = plant.data)
)







