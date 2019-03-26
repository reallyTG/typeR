library(ReIns)


### Name: LognormalQQ_der
### Title: Derivative plot of the log-normal QQ-plot
### Aliases: LognormalQQ_der

### ** Examples

data(norwegianfire)

# Log-normal QQ-plot for Norwegian Fire Insurance data for claims in 1976.
LognormalQQ(norwegianfire$size[norwegianfire$year==76])

# Derivate plot
LognormalQQ_der(norwegianfire$size[norwegianfire$year==76])



