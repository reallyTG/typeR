library(ReIns)


### Name: WeibullQQ_der
### Title: Derivative plot of the Weibull QQ-plot
### Aliases: WeibullQQ_der

### ** Examples

data(norwegianfire)

# Weibull QQ-plot for Norwegian Fire Insurance data for claims in 1976.
WeibullQQ(norwegianfire$size[norwegianfire$year==76])

# Derivative of Weibull QQ-plot for Norwegian Fire Insurance data for claims in 1976.
WeibullQQ_der(norwegianfire$size[norwegianfire$year==76])



