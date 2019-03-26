library(DTSg)


### Name: aggregate.DTSg
### Title: Aggregate Values
### Aliases: aggregate.DTSg aggregate

### ** Examples

# new DTSg object
x <- DTSg$new(values = flow)

# mean yearly river flows
## R6 method
x$aggregate(funby = byY_____, fun = mean, na.rm = TRUE)

## S3 method
aggregate(x = x, funby = byY_____, fun = mean, na.rm = TRUE)




