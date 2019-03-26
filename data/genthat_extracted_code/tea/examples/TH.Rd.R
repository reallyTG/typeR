library(tea)


### Name: TH
### Title: Sequential Goodness of Fit Testing for the Generalized Pareto
###   Distribution
### Aliases: TH

### ** Examples

data=rexp(1000)
u=seq(quantile(data,.1),quantile(data,.9),,100)
A=TH(data,u);A



