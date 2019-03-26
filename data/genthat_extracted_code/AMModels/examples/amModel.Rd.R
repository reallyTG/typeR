library(AMModels)


### Name: amModel
### Title: Create An 'amModel' Object That Pairs Models With Their Metadata
### Aliases: amModel amModel-class
### Keywords: classes manip

### ** Examples



# run models from from lm helpfile
## Annette Dobson (1990) "An Introduction to Generalized Linear Models".
## Page 9: Plant Weight Data.
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)
lm.D90 <- lm(weight ~ group - 1) # omitting intercept

# note the original class of models is 'lm'
class(lm.D9)

# wrap lm.D9 in an amModel object
mod1 <- amModel(model = lm.D9, comment='example from lm')

# summarize mod1; summary for the original object class, plus the metadata
summary(mod1)

# convert lm.D90 to an amModel object
mod2 <- amModel(model = lm.D90, comment='second example from lm')

# use the function, amModelLib, to create a new amModelLib that includes both models
# the models must be supplied as a named list
mymodels <- amModelLib(
    models = list(
        mod1 = mod1, 
        mod2 = mod2
    ), 
    description = "This amModelLib stores linear models from the lm helpfile."
)

# list the models of the amModelLib
lsModels(mymodels)

# the modelMeta function can be used to retrieve model metadata
modelMeta(mymodels, 'mod1')

# the modelMeta function can also be used to set model metadata
modelMeta(mymodels, 'mod1') <- list(
    url = "https://stat.ethz.ch/R-manual/R-devel/library/stats/html/lm.html"
)
modelMeta(amml = mymodels, 'mod1')

# use getAMModel to extract the model by  name
getAMModel(amml = mymodels, 'mod2', as.list = FALSE)

# notice the retrieved model is returned in its original class
class(getAMModel(amml = mymodels, 'mod2', as.list = FALSE))

# create a new empty amModelLib called mymodels2
mymodels2 <- amModelLib(description = "A second amModelLib called mymodels2.")

# use insertAMModelLib to insert amModel objects to an existing amModelLib
mymodels2 <- insertAMModelLib(models = list(mod1 = mod1, mod2 = mod2))
 
# use rmModel to remove an amModel object from an amModelLib
rmModel('mod2', amml = mymodels2)



