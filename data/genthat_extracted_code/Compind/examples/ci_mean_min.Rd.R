library(Compind)


### Name: ci_mean_min
### Title: Mean-Min Function
### Aliases: ci_mean_min

### ** Examples

data(EU_NUTS1)
data_norm = normalise_ci(EU_NUTS1,c(2:3),c("NEG","POS"),method=2)
CI = ci_mean_min(data_norm$ci_norm, alpha=0.5, beta=1)




