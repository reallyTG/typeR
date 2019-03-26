library(ReIns)


### Name: secura
### Title: Secura dataset
### Aliases: secura
### Keywords: datasets

### ** Examples

data(secura)

# Exponential QQ-plot of Secura data
ExpQQ(secura$size)

# Pareto QQ-plot of Secura data
ParetoQQ(secura$size)

# Mean excess plot of Secura data (function of k)
MeanExcess(secura$size, k=TRUE)

# Mean excess plot of Secura data (function of order statistics)
MeanExcess(secura$size, k=FALSE)



