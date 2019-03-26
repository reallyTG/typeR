library(bbw)


### Name: bootBW
### Title: 'bootBW' : Blocked Weighted Bootstrap
### Aliases: bootBW

### ** Examples

# Example function - estimate a proportion for a binary (0/1) variable):

oneP <- function(x, params) {
  v1 <- params[1]
  v1Data <- x[[v1]]
  oneP <- mean(v1Data, na.rm = TRUE)
  return(oneP)
}

# Example call to bootBW function using RAM-OP test data:

bootP <- bootBW(x = indicatorsHH,
                w = villageData,
                statistic = oneP,
                params = "anc1",
                outputColumns = "anc1",
                replicates = 9)

# Example estimate with 95% CI:

quantile(bootP, probs = c(0.500, 0.025, 0.975), na.rm = TRUE)




