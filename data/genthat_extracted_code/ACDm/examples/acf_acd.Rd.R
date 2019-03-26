library(ACDm)


### Name: acf_acd
### Title: Autocorrelation function plots for ACD models
### Aliases: acf_acd

### ** Examples

fitModel <- acdFit(adjDurData)
acf_acd(fitModel, conf_level = 0.95, max = 50, min = 1)

f <- acf_acd(durData)
f




