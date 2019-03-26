library(schoRsch)


### Name: ntiles
### Title: Split distribution into quantiles
### Aliases: ntiles

### ** Examples

## Build data frame
var1 <- c(1:9)
var2 <- c(1,1,1,2,2,2,3,3,3)
tmpdata <- data.frame(cbind(var1,var2))
tmpdata$var2 <- as.factor(tmpdata$var2)

## Get overall bins and display result
tmpdata$bins <- ntiles(tmpdata, dv = "var1", bins=3)
tmpdata

## Get bins separately for each factor level
## and display result
tmpdata$bins2 <- ntiles(tmpdata, dv = "var1", bins=3, factors = "var2")
tmpdata



