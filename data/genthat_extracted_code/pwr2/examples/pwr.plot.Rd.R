library(pwr2)


### Name: pwr.plot
### Title: Power curves for different parameter settings (sample size and
###   effect size) in balanced one-way ANOVA models
### Aliases: pwr.plot
### Keywords: Graph Power Curve

### ** Examples

## Example 1
n <- seq(2, 30, by=4)
f <- 0.5
pwr.plot(n=n, k=5, f=f, alpha=0.05)

## Example 2
n <- 20
f <- seq(0.1, 1.0, length.out=10)
pwr.plot(n=n, k=5, f=f, alpha=0.05)

## Example 3
n <- seq(2, 30, by=4)
f <- seq(0.1, 1.0, length.out=10)
pwr.plot(n=n, k=5, f=f, alpha=0.05)



