library(imputeTestbench)


### Name: mape
### Title: Mean Absolute Percent Error Calculation
### Aliases: mape

### ** Examples

## Generate 100 random numbers within some limits
x <- sample(1:7, 100, replace = TRUE)
y <- sample(1:4, 100, replace = TRUE)
z <- mape(x, y)
z



