library(ReIns)


### Name: ParetoQQ_der
### Title: Derivative plot of the Pareto QQ-plot
### Aliases: ParetoQQ_der

### ** Examples

data(norwegianfire)

# Pareto QQ-plot for Norwegian Fire Insurance data for claims in 1976.
ParetoQQ(norwegianfire$size[norwegianfire$year==76])

# Derivate plot
ParetoQQ_der(norwegianfire$size[norwegianfire$year==76])



