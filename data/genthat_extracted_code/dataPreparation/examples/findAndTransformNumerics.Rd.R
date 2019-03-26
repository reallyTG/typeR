library(dataPreparation)


### Name: findAndTransformNumerics
### Title: Identify numeric columns in a dataSet set
### Aliases: findAndTransformNumerics

### ** Examples

# Let's build a dataSet set
dataSet <- data.frame(ID = 1:5,
                  col1 = c("1.2", "1.3", "1.2", "1", "6"), 
                  col2 = c("1,2", "1,3", "1,2", "1", "6")
                  )

# using the findAndTransformNumerics
findAndTransformNumerics(dataSet, n_test = 5)



