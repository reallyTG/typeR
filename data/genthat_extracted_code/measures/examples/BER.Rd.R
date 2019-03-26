library(measures)


### Name: BER
### Title: Balanced error rate
### Aliases: BER

### ** Examples

n = 20
set.seed(122)
truth = as.factor(sample(c(1,2,3), n, replace = TRUE))
response = as.factor(sample(c(1,2,3), n, replace = TRUE))
BER(truth, response)



