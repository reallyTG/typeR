library(growthrates)


### Name: all_splines
### Title: Fit Exponential Growth Model with Smoothing Spline
### Aliases: all_splines all_splines.formula all_splines.data.frame

### ** Examples


data(bactgrowth)
L <- all_splines(value ~ time | strain + conc + replicate,
                 data = bactgrowth, spar = 0.5)

par(mfrow=c(4, 3))
plot(L)
results <- results(L)
xyplot(mumax ~ log(conc + 1)|strain, data=results)

## fit splines at lower grouping levels
L2 <- all_splines(value ~ time | conc + strain,
                    data = bactgrowth, spar = 0.5)
plot(L2)

## total data set without any grouping
L3 <- all_splines(value ~ time,
                    data = bactgrowth, spar = 0.5)
par(mfrow=c(1, 1))
plot(L3)




