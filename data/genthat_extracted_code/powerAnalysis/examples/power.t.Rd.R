library(powerAnalysis)


### Name: power.t
### Title: Power calculations for t-test
### Aliases: power.t

### ** Examples

## one sample two sided test, calculate power
power.t(es=0.2,n=60,sig.level=0.10,type="one",alternative="two.sided")

## one sample one sided (left tail) test, calculate power
power.t(es=0.2,n=60,sig.level=0.10,type="one",alternative="left")

## one sample one sided (right tail) test, calculate power
power.t(es=0.2,n=60,sig.level=0.10,type="one",alternative="right")

## one sample two sided test, calculate sampe size
power.t(es=0.2,power=0.8,sig.level=0.05,type="one",alternative="two.sided")

## one sample two sided test, calculate effect size
power.t(n=200,power=0.8,sig.level=0.05,type="one",alternative="two.sided")

## one sample two sided test, calculate sig.level
power.t(es=0.2,n=200,power=0.8,type="one",alternative="two.sided")

## paired sample two sided test, calculate power
power.t(es=0.559,n=40,sig.level=0.05,type="paired",alternative="two.sided")

## paired sample two sided test, calculate sample size
power.t(es=0.15,power=0.8,sig.level=0.05,type="paired",alternative="two.sided")

## paired sample two sided test, calculate effect size
power.t(n=200,power=0.8,sig.level=0.05,type="paired",alternative="two.sided")

## two sample two sided test, calculate power
power.t(es=0.15,n=300,sig.level=0.05,type="two",alternative="two.sided")

## two sample two sided test, calculate sample size
power.t(es=0.15,power=0.8,sig.level=0.05,type="two",alternative="two.sided")

## two sample two sided test, calculate effect size
power.t(n=300,power=0.8,sig.level=0.05,type="two",alternative="two.sided")

## two sample (unequal size), calculate sample size
power.t(es=0.15,power=0.8,sig.level=0.05,type="unequal",ratio=2,alternative="two.sided")

power.t(es=0.1,n=3000,sig.level=0.05,type="unequal",ratio=2,alternative="two.sided")



