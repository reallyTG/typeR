library(DTSg)


### Name: alter.DTSg
### Title: Alter Time Series
### Aliases: alter.DTSg alter

### ** Examples

# new DTSg object
x <- DTSg$new(values = flow)

# extract the first two years
## R6 method
x$alter(from = "2007-01-01", to = "2008-12-31")

## S3 method
alter(x = x, from = "2007-01-01", to = "2008-12-31")




