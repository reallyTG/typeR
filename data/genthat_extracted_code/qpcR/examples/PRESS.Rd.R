library(qpcR)


### Name: PRESS
### Title: Allen's PRESS (Prediction Sum-Of-Squares) statistic, aka
###   P-square
### Aliases: PRESS
### Keywords: models nonlinear

### ** Examples

## Example for PCR analysis.
m1 <- pcrfit(reps, 1, 2, l7)
PRESS(m1)

## Compare PRESS statistic in models
## with fewer parameters.
m2 <- pcrfit(reps, 1, 2, l5)
PRESS(m2)
m3 <- pcrfit(reps, 1, 2, l4)
PRESS(m3)

## Example for linear regression.
x <- 1:10
y <- rnorm(10, x, 0.1)
mod <- lm(y ~ x)
PRESS(mod)

## Example for NLS fitting.     
DNase1 <- subset(DNase, Run == 1)
fm1DNase1 <- nls(density ~ SSlogis(log(conc), Asym, xmid, scal), DNase1)
res <- PRESS(fm1DNase1)

## PRESS residuals plot.
barplot(res$residuals)



