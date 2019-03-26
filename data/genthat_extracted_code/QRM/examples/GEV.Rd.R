library(QRM)


### Name: GEV
### Title: Generalized Extreme Value Distribution
### Aliases: GEV pGEV qGEV dGEV rGEV fit.GEV
### Keywords: distribution

### ** Examples

quantValue <- 4.5
pGEV(q = quantValue, xi = 0, mu = 1.0, sigma = 2.5) 
pGumbel(q = quantValue, mu = 1.0, sigma = 2.5)
## Fitting to monthly block-maxima
data(nasdaq)
l <- -returns(nasdaq)
em <- timeLastDayInMonth(time(l))
monmax <- aggregate(l, by = em, FUN = max) 
mod1 <- fit.GEV(monmax) 



