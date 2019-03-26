library(pwr2)


### Name: pwr.2way
### Title: Power calculation for balanced two-way ANOVA models
### Aliases: pwr.2way
### Keywords: Two-Way ANOVA Power

### ** Examples

## Example 1
pwr.2way(a=3, b=3, alpha=0.05, size.A=4, size.B=5, f.A=0.8, f.B=0.4)

## Example 2
pwr.2way(a=3, b=3, alpha=0.05, size.A=4, size.B=5, delta.A=4, delta.B=2, sigma.A=2, sigma.B=2)
pwr.2way(a=3, b=3, alpha=0.05, size.A=4, size.B=5, f.A=NULL, f.B=NULL, 
delta.A=4, delta.B=2, sigma.A=2, sigma.B=2)



