library(CfEstimateQuantiles)


### Name: cf_estimate_quantiles
### Title: Estimate quantiles of random variable
### Aliases: cf_estimate_quantiles

### ** Examples

cf_order = 8
cumulants = rep(0, cf_order);
for (i in 1:cf_order)
  cumulants[i] = (1/i)*factorial(i);  
probabilities = seq(0.01, 0.99, 0.05)
estimated_quantiles= cf_estimate_quantiles(cf_order, probabilities, cumulants)
plot(probabilities, estimated_quantiles, "l", 
  main = "Cornish-Fisher approximation for exp(1) with order = 8", 
  xlab = "Probability", ylab = "Quantile")



