library(FAOSTAT)


### Name: Aggregation
### Title: Compute Aggregates
### Aliases: Aggregation

### ** Examples

## example.df = data.frame(FAOST_CODE = rep(c(1, 2, 3), 2),
##                        Year = rep(c(2010, 2011), c(3, 3)),
##                        value = rep(c(1, 2, 3), 2),
##                        weight = rep(c(0.3, 0.7, 1), 2))

## Lets aggregate country 1 and 2 into one country and keep country
## 3 seperate.
## relation.df = data.frame(FAOST_CODE = 1:3, NEW_CODE = c(1, 1, 2))



