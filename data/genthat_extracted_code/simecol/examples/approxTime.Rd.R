library(simecol)


### Name: approxTime
### Title: Linear Interpolation with Complete Matrices or Data Frames
### Aliases: approxTime approxTime1
### Keywords: arith

### ** Examples

inputs <- data.frame(time = 1:10, y1 = rnorm(10), y2 = rnorm(10, mean = 50))
input  <- approxTime(inputs, c(2.5, 3), rule = 2)



