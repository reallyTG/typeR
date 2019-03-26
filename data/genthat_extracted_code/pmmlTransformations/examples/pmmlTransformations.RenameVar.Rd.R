library(pmmlTransformations)


### Name: RenameVar
### Title: Renames a variable in the WrapData transform object
### Aliases: RenameVar
### Keywords: manip utilities methods

### ** Examples

# Load the standard iris dataset, already built into R
   data(iris)

# First wrap the data
   irisBox <- WrapData(iris)

# We wish to refer to the variables "Sepal.Length" and 
# "Sepal.Width" as "SL" and "SW"
  irisBox <- RenameVar(irisBox,"column1->SL")
  irisBox <- RenameVar(irisBox,"Sepal.Width->SW")




