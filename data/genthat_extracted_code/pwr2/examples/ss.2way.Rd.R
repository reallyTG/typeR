library(pwr2)


### Name: ss.2way
### Title: Sample size calculation for balanced two-way ANOVA models
### Aliases: ss.2way
### Keywords: Two-Way ANOVA Sample Size

### ** Examples

## Example 1
ss.2way(a=3, b=3, alpha=0.05, beta=0.1, f.A=0.4, f.B=0.2, B=100)
ss.2way(a=3, b=3, alpha=0.05, beta=0.1, f.A=0.4, f.B=0.2, 
delta.A=NULL, delta.B=NULL, sigma.A=NULL, sigma.B=NULL, B=100)

## Example 2
ss.2way(a=3, b=3, alpha=0.05, beta=0.1, delta.A=1, delta.B=2, sigma.A=2, sigma.B=2, B=100)



