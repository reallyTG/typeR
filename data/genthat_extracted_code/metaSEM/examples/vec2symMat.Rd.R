library(metaSEM)


### Name: vec2symMat
### Title: Convert a Vector into a Symmetric Matrix
### Aliases: vec2symMat
### Keywords: utilities

### ** Examples

vec2symMat(1:6)
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    2    4    5
# [3,]    3    5    6

vec2symMat(1:6, diag=FALSE)
#      [,1] [,2] [,3] [,4]
# [1,]    1    1    2    3
# [2,]    1    1    4    5
# [3,]    2    4    1    6
# [4,]    3    5    6    1

vec2symMat(letters[1:6])
#      [,1] [,2] [,3]
# [1,] "a"  "b"  "c" 
# [2,] "b"  "d"  "e" 
# [3,] "c"  "e"  "f" 



