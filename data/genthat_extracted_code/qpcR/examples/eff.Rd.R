library(qpcR)


### Name: eff
### Title: The amplification efficiency curve of a fitted object
### Aliases: eff
### Keywords: models nonlinear

### ** Examples

## With default 100 points per cycle.
m1 <- pcrfit(reps, 1, 7, l5)
eff(m1, plot = TRUE) 

## Not all data and only 10 points per cycle.
eff(m1, sequence = c(5, 35, 0.1), plot = TRUE) 

## When using cubic splines it is preferred 
## to use the smoothing option.
#eff(m1, method = "spline", plot = TRUE, smooth = TRUE, baseshift = 0.3)  



