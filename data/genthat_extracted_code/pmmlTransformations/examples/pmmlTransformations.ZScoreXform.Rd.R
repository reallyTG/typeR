library(pmmlTransformations)


### Name: ZScoreXform
### Title: Performs a z-score normalization on continuous values in
###   accordance to the PMML element: *NormContinuous*
### Aliases: ZScoreXform
### Keywords: manip utilities methods

### ** Examples

# Load the standard iris dataset, already built into R
   data(iris)

# First wrap the data
   irisBox <- WrapData(iris)

# Perform a z-transform on all numeric variables of the loaded 
# iris dataset. These would be Sepal.Length, Sepal.Width, 
# Petal.Length, and Petal.Width. The 4 new derived variables 
# will be named derived_Sepal.Length, derived_Sepal.Width, 
# derived_Petal.Length, and derived_Petal.Width
   ZScoreXform(irisBox)

# Perform a z-transform on the 1st column of the dataset (Sepal.Length)
# and give the derived variable the name "dsl" 
   ZScoreXform(irisBox,xformInfo="column1 -> dsl")

# Repeat the above operation; adding the new transformed variable 
# to the irisBox object
   irisBox <- ZScoreXform(irisBox,xformInfo="column1 -> dsl")

# Transform Sepal.Width(the 2nd column)
# The new transformed variable will be given the default name 
# "derived_Sepal.Width"
   ZScoreXform(irisBox,xformInfo="column2")

# Repeat the same operation as above, this time using the variable 
# name
   ZScoreXform(irisBox,xformInfo="Sepal.Width")

# Repeat the same operation as above, assign the transformed variable 
# "derived_Sepal.Width". The value of 1.0 if the input value of the 
# "Sepal.Width" variable is missing. Add the new information to the 
# irisBox object. 
   irisBox <- ZScoreXform(irisBox,xformInfo="Sepal.Width",
                          "mapMissingTo=1.0")




