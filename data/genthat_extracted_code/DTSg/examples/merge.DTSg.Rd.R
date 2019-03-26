library(DTSg)


### Name: merge.DTSg
### Title: Merge Two DTSg Objects
### Aliases: merge.DTSg merge

### ** Examples

# new DTSg object
x <- DTSg$new(values = flow)

# merge with data.table
## R6 method
x$merge(y = flow, suffixes = c("_1", "_2"))

## S3 method
merge(x = x, y = flow, suffixes = c("_1", "_2"))




