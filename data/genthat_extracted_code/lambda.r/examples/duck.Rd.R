library(lambda.r)


### Name: duck-typing
### Title: Functions for duck typing
### Aliases: %isa% %hasa% %hasall%
### Keywords: methods programming

### ** Examples

5 %isa% numeric

Point(r,theta, 'polar') %as% {
  o <- list(r=r,theta=theta)
  o@system <- 'polar'
  o
}

p <- Point(5, pi/2, 'polar')
p 




