library(colorednoise)


### Name: colored_multi_rnorm
### Title: Generate Multiple Cross-Correlated & Autocorrelated Variables
### Aliases: colored_multi_rnorm

### ** Examples

cov <- matrix(c(0.037, 0.044, -0.048, 0.044, 0.247, -0.008, -0.047, -0.008, 0.074), nrow = 3)
test <- colored_multi_rnorm(100, c(0, 3, 5), c(1, 0.5, 1), c(0.5, -0.3, 0), cov)
var(test)
library(dplyr)
test %>% as.data.frame() %>% summarize_all(.funs = c("mean", "sd", "autocorrelation"))



