library(OpenMx)


### Name: omxAssignFirstParameters
### Title: Assign First Available Values to Model Parameters
### Aliases: omxAssignFirstParameters

### ** Examples


A     <- mxMatrix('Full', 3, 3, values = c(1:9), labels = c('a','b', NA),
                  free = TRUE, name = 'A')
model <- mxModel(model=A, name = 'model')
model <- omxAssignFirstParameters(model)

# Note: All cells with the same label now have the same start value.
# Note also that NAs are untouched.

model$matrices$A

# $labels
#      [,1] [,2] [,3]
# [1,] "a"  "a"  "a" 
# [2,] "b"  "b"  "b" 
# [3,] NA   NA   NA  
# 
# $values
#      [,1] [,2] [,3]
# [1,]    1    1    1
# [2,]    2    2    2
# [3,]    3    6    9




