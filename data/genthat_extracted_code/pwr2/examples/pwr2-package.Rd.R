library(pwr2)


### Name: pwr2-package
### Title: Power and Sample Size Analysis for One-way and Two-way ANOVA
###   Models
### Aliases: pwr2-package pwr2
### Keywords: ANOVA Sample Size Power

### ** Examples

## Example 1
pwr.2way(a=3, b=3, alpha=0.05, size.A=4, size.B=5, f.A=0.8, f.B=0.4)
pwr.2way(a=3, b=3, alpha=0.05, size.A=4, size.B=5, delta.A=4, delta.B=2, sigma.A=2, sigma.B=2)

## Example 2
ss.2way(a=3, b=3, alpha=0.05, beta=0.1, delta.A=1, delta.B=2, sigma.A=2, sigma.B=2, B=100)

## Example 3
n <- seq(2, 30, by=4)
f <- seq(0.1, 1.0, length.out=10)
pwr.plot(n=n, k=5, f=f, alpha=0.05)



