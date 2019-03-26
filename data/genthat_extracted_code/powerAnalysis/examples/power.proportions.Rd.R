library(powerAnalysis)


### Name: power.proportions
### Title: Power calculations for proportion tests (two-sided)
### Aliases: power.proportions

### ** Examples

## one sample
power.proportions(n=600,h=0.3,type="one")

## two sample with same sample size
power.proportions(h=0.2,n=600)

## two sample with different sample size
power.proportions(h=0.2,n=1200,type="unequal",ratio=2)




