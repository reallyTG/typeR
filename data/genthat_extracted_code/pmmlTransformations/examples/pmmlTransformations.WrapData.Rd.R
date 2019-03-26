library(pmmlTransformations)


### Name: WrapData
### Title: Wrap raw data in an R object
### Aliases: WrapData

### ** Examples

# Load the standard iris dataset, already built into R
   data(iris)

# Make a wrapper object for the iris dataset to use with 
# transformation functions
   irisBox <- WrapData(iris)

# Output only the transformations in PMML format. 
# This example will output just an empty "LocalTransformations" 
# element as no transformations were performed.
   library(pmml)
   pmml(NULL,transforms=irisBox)
# This will also work
   pmml(,transforms=irisBox)



