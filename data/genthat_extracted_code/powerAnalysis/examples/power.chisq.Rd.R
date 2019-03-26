library(powerAnalysis)


### Name: power.chisq
### Title: Power calculations for chi-squared test
### Aliases: power.chisq

### ** Examples

## calculate power
power.chisq(es=0.16,df=1,n=530,sig.level=0.05)

## calculate sig.level
power.chisq(es=0.16,df=1,n=530,power=0.9576)

## calculate sample size
power.chisq(es=0.16,df=1,power=0.9576,sig.level=0.05)

## calculate effect size
power.chisq(df=1,n=530,power=0.9576,sig.level=0.05)



