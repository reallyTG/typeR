library(pmmlTransformations)


### Name: NormDiscreteXform
### Title: Normalize discrete values in accordance to the PMML element:
###   *NormDiscrete*
### Aliases: NormDiscreteXform
### Keywords: manip

### ** Examples

# Load the standard iris dataset, already available in R
   data(iris)

# First wrap the data
   irisBox <- WrapData(iris)

# Discretize the "Species" variable. This will find all possible 
# values of the "Species" variable and define new variables. The 
# parameter name used here should be replaced by the new preferred 
# parameter name as shown in the next example below.
#
# 	"Species_setosa" such that it is 1 if 
#      "Species" equals "setosa", else 0;
# 	"Species_versicolor" such that it is 1 if 
#      "Species" equals "versicolor", else 0;
# 	"Species_virginica" such that it is 1 if 
#      "Species" equals "virginica", else 0

  irisBox <- NormDiscreteXform(irisBox,inputVar="Species")
  
# Exact same operation performed with a different parameter name. 
# Use of this new parameter is the preferred method as the previous 
# parameter will be deprecated soon.

  irisBox <- WrapData(iris)
  irisBox <- NormDiscreteXform(irisBox,xformInfo="Species")
  



