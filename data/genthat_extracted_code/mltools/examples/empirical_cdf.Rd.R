library(mltools)


### Name: empirical_cdf
### Title: Empirical Cumulative Distribution Function
### Aliases: empirical_cdf

### ** Examples

library(data.table)
dt <- data.table(x=c(0.3, 1.3, 1.4, 3.6), y=c(1.2, 1.2, 3.8, 3.9))
empirical_cdf(dt$x, ubounds=1:4)
empirical_cdf(dt, ubounds=CJ(x = 1:4, y = 1:4))




