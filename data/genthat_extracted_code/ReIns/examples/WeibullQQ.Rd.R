library(ReIns)


### Name: WeibullQQ
### Title: Weibull quantile plot
### Aliases: WeibullQQ

### ** Examples

data(norwegianfire)

# Weibull QQ-plot for Norwegian Fire Insurance data for claims in 1976.
WeibullQQ(norwegianfire$size[norwegianfire$year==76])

# Derivative of Weibull QQ-plot for Norwegian Fire Insurance data for claims in 1976.
WeibullQQ_der(norwegianfire$size[norwegianfire$year==76])



