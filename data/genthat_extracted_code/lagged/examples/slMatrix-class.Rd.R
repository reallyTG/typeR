library(lagged)


### Name: slMatrix-class
### Title: Class "slMatrix"
### Aliases: slMatrix-class
### Keywords: classes

### ** Examples

# data(ex1f)
m1 <- rbind( c(1,0.81,0),c(1, 0.4972376, 0.4972376) )
x <- slMatrix(m1)
x[1,0]
x[1:2,0:1]
x[1:3,1:3,type="tt"]



