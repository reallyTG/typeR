library(tensorBSS)


### Name: tensorCentering
### Title: Center an Array of Observations
### Aliases: tensorCentering
### Keywords: utilities array

### ** Examples

## Generate sample data.
n <- 1000
x <- t(cbind(rnorm(n, mean = 0),
             rnorm(n, mean = 1),
             rnorm(n, mean = 2),
             rnorm(n, mean = 3),
             rnorm(n, mean = 4),
             rnorm(n, mean = 5)))
             
dim(x) <- c(3, 2, n)

## Centered data
xcen <- tensorCentering(x)

## Check the means of individual cells
apply(xcen, 1:2, mean)



