library(DTSg)


### Name: rollapply.DTSg
### Title: Rolling Window Function
### Aliases: rollapply.DTSg rollapply

### ** Examples

# new DTSg object
x <- DTSg$new(values = flow)

# calculate moving average
## R6 method
x$rollapply(fun = mean, na.rm = TRUE, before = 2, after = 2)

## S3 method
rollapply(x = x, fun = mean, na.rm = TRUE, before = 2, after = 2)




