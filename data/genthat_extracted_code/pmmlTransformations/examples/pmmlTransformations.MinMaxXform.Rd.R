library(pmmlTransformations)


### Name: MinMaxXform
### Title: Normalizes continuous values in accordance to the PMML element:
###   *NormContinuous*
### Aliases: MinMaxXform
### Keywords: manip

### ** Examples

# Load the standard iris dataset, already available in R
   data(iris)
   library(pmmlTransformations)

# First wrap the data
   irisBox <- WrapData(iris)

# Normalize all numeric variables of the loaded iris dataset to lie 
# between 0 and 1. These would normalize "Sepal.Length", "Sepal.Width", 
# "Petal.Length", "Petal.Width" to the 4 new derived variables named 
# derived_Sepal.Length, derived_Sepal.Width, derived_Petal.Length, 
# derived_Petal.Width.
   MinMaxXform(irisBox)

# Normalize the 1st column values of the dataset (Sepal.Length) to lie 
# between 0 and 1 and give the derived variable the name "dsl" 
   MinMaxXform(irisBox,xformInfo="column1 -> dsl")

# Repeat the above operation; adding the new transformed variable to 
# the irisBox object
   irisBox <- MinMaxXform(irisBox,xformInfo="column1 -> dsl")

# Transform Sepal.Width(the 2nd column)
# The new transformed variable will be given the default name 
# "derived_Sepal.Width" 
   MinMaxXform(irisBox,xformInfo="column2")

# Repeat the same operation as above, this time using the variable name
   MinMaxXform(irisBox,xformInfo="Sepal.Width")

# Repeat the same operation as above, assign the transformed variable, 
# "derived_Sepal.Width". the value of 0.5 if the input value of the 
# "Sepal.Width" variable is missing 
   MinMaxXform(irisBox,xformInfo="Sepal.Width", "mapMissingTo=0.5")

# Transform Sepal.Width(the 2nd column) to lie between 2 and 3. 
# The new transformed variable will be given the default name 
# "derived_Sepal.Width"
   MinMaxXform(irisBox,xformInfo="column2->[2,3]")

# Repeat the above transformation, this time the transformed variable 
# lies between 0 and 10
   irisBox <- MinMaxXform(irisBox,xformInfo="column2->[,10]")



