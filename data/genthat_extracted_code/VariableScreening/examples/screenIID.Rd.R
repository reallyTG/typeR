library(VariableScreening)


### Name: screenIID
### Title: Feature Selection for Ultrahigh-Dimensional Datasets with
###   Independent Subjects,
### Aliases: screenIID
### Keywords: Variable analysis discriminant high-dimensional regression,
###   screening, selection, variable

### ** Examples

set.seed(12345678)
data1 <- simulateDCSIS(n=100,p=1000)
answers<- screenIID(X = data1$X, Y = data1$Y, method="DC-SIS")
print(which(answers$rank<=10)) # Print the columns of X corresponding to the ten best-ranked
                               # predictors. Note that in the simulation, the true predictors
                               # are columns 1, 2, 12, and 22, and three of these are included,
                               # indicating that the function worked fairly well.



