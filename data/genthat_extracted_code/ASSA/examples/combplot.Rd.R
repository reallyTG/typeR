library(ASSA)


### Name: combplot
### Title: Comb-plot
### Aliases: combplot
### Keywords: comb-plot

### ** Examples

## Tracking the US Business Cycle (de Carvalho and Rua, 2017; Fig. 5)
data(GDPIP)
fit <- bssa(log(GDPIP[, 1]))
combplot(fit)



