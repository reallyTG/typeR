library(ASSA)


### Name: bmssa
### Title: Multivariate Singular Spectrum Business Cycle Indicator
### Aliases: bmssa bmssa.default

### ** Examples

## Tracking the US Business Cycle (de Carvalho et al, 2017; Fig. 6) 
data(GDPIP)
fit <- bmssa(log(GDPIP))
plot(fit)
print(fit)



