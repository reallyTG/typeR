library(ROCit)


### Name: rankorderdata
### Title: Rank order data
### Aliases: rankorderdata

### ** Examples

score <- c(0.4 * runif(20) + 0.2, 0.4*runif(20))
class <- c(rep("A",20), rep("B",20))
returndata <- rankorderdata(score, class, dec = FALSE)
returndata




