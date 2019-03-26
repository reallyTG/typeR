library(OpenMx)


### Name: mxModel
### Title: Create MxModel Object
### Aliases: mxModel

### ** Examples


library(OpenMx)

# At the simplest, you can create an empty model,
#  placing it in an object, and add to it later
emptyModel <- mxModel(model="IAmEmpty")

# Create a model named 'firstdraft' with one matrix 'A'
firstModel <- mxModel(model='firstdraft', 
                 mxMatrix(type='Full', nrow = 3, ncol = 3, name = "A"))

# Update 'firstdraft', and rename the model 'finaldraft'
finalModel <- mxModel(model=firstModel,
                 mxMatrix(type='Symm', nrow = 3, ncol = 3, name = "S"),
                 mxMatrix(type='Iden', nrow = 3, name = "F"),
                 name= "finaldraft")

# Add data to the model from an existing data frame in object 'data'
data(twinData)  # load some data
finalModel <- mxModel(model=finalModel, mxData(twinData, type='raw'))

# Two ways to view the matrix named "A" in MxModel object 'model'

finalModel$A

finalModel$matrices$A

# A working example using OpenMx Path Syntax
data(HS.ability.data)  # load the data

# The manifest variables loading on each proposed latent variable
Spatial   <- c("visual", "cubes", "paper")
Verbal    <- c("general", "paragrap", "sentence")
Math      <- c("numeric", "series", "arithmet")

latents   <- c("vis", "math", "text")
manifests <-  c(Spatial, Math, Verbal)

HSModel <- mxModel(model="Holzinger_and_Swineford_1939", type="RAM", 
    manifestVars = manifests, # list the measured variables (boxes)
    latentVars   = latents,   # list the latent variables (circles)
    # factor loadings from latents to  manifests
    mxPath(from="vis",  to=Spatial),# factor loadings
    mxPath(from="math", to=Math),   # factor loadings
    mxPath(from="text", to=Verbal), # factor loadings

    # Allow latent variables to covary 
    mxPath(from="vis" , to="math", arrows=2, free=TRUE),
    mxPath(from="vis" , to="text", arrows=2, free=TRUE),
    mxPath(from="math", to="text", arrows=2, free=TRUE),

    # Allow latent variables to have variance
    mxPath(from=latents, arrows=2, free=FALSE, values=1.0),
    # Manifest have residual variance
    mxPath(from=manifests, arrows=2),   
    # the data to be analysed
    mxData(cov(HS.ability.data[,manifests]), type = "cov", numObs = 301))
    
fitModel <- mxRun(HSModel) # run the model
summary(fitModel) # examine the output: Fit statistics and path loadings




