library(RSurveillance)


### Name: ap
### Title: Apparent prevalence
### Aliases: ap
### Keywords: methods

### ** Examples

# examples for ap function
n<- 200
x<- 25
conf<- 0.95
ap(x, n)
ap(seq(10, 100, 10), 200, type = "agresti")
ap(seq(10, 100, 10), 200, type = "all")



