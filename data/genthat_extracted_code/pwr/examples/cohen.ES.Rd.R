library(pwr)


### Name: cohen.ES
### Title: Conventional effects size
### Aliases: cohen.ES
### Keywords: htest

### ** Examples

## medium effect size for the correlation test
cohen.ES(test="r", size="medium")

## sample size for a medium size effect in the two-sided correlation test
## using the conventional power of 0.80
pwr.r.test(r=cohen.ES(test="r",size="medium")$effect.size,
  power=0.80, sig.level=0.05, alternative="two.sided")



