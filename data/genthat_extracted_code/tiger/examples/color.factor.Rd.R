library(tiger)


### Name: color.factor
### Title: Create colors with intensity according to the magnitude of a
###   value
### Aliases: color.factor
### Keywords: color

### ** Examples

   data <- 1:10
   cols=color.factor("red", data, max=10)
   plot(data, col=cols)


   cols=color.factor(c("red","green","blue"), data, max=10)
   plot(data, col=cols)



