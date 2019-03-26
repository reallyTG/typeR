library(ASSA)


### Name: bssa
### Title: Singular Spectrum Business Cycle Indicator
### Aliases: bssa bssa.default

### ** Examples

## Tracking the US Business Cycle (de Carvalho et al, 2017; Fig. 6) 
data(GDPIP)
fit <- bssa(log(GDPIP[, 1]))
plot(fit)
print(fit)



