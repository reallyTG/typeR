library(WebPower)


### Name: wp.t
### Title: Statistical Power Analysis for t-Tests
### Aliases: wp.t

### ** Examples

#To calculate the power for one sample t-test given sample size and effect size:
wp.t(n1=150, d=0.2, type="one.sample")
#  One-sample t-test
#
#	n   d alpha    power
#	150	0.2	0.05	0.682153
#
#  URL: http://psychstat.org/ttest

#To calculate the power for paired t-test given sample size and effect size:
wp.t(n1=40, d=-0.4, type="paired", alternative="less")
#  Paired t-test
#
#     n    d alpha     power
#    40 -0.4  0.05 0.7997378
#
#  NOTE: n is number of *pairs*
#  URL: http://psychstat.org/ttest

#To estimate the required sample size given power and effect size for paired t-test :
wp.t(d=0.4, power=0.8, type="paired", alternative="greater")
#  Paired t-test
#
#           n   d alpha power
#    40.02908 0.4  0.05   0.8
#
#  NOTE: n is number of *pairs*
#  URL: http://psychstat.org/ttest

#To estimate the power for balanced two-sample t-test given sample size and effect size:
wp.t(n1=70, d=0.3, type="two.sample", alternative="greater")
#  Two-sample t-test
#
#     n   d alpha     power
#    70 0.3  0.05 0.5482577
#
#  NOTE: n is number in *each* group
#  URL: http://psychstat.org/ttest

#To estimate the power for unbalanced two-sample t-test given sample size and effect size:
wp.t(n1=30, n2=40, d=0.356, type="two.sample.2n", alternative="two.sided")
#  Unbalanced two-sample t-test
#
#    n1 n2     d alpha     power
#    30 40 0.356  0.05 0.3064767
#
#  NOTE: n1 and n2 are number in *each* group
#  URL: http://psychstat.org/ttest2n

#To estimate the power curve for unbalanced two-sample t-test given a sequence of effect sizes:
res <- wp.t(n1=30, n2=40, d=seq(0.2,0.8,0.05), type="two.sample.2n",
                                             alternative="two.sided")
res
#  Unbalanced two-sample t-test
#
#    n1 n2    d alpha     power
#    30 40 0.20  0.05 0.1291567
#    30 40 0.25  0.05 0.1751916
#    30 40 0.30  0.05 0.2317880
#    30 40 0.35  0.05 0.2979681
#    30 40 0.40  0.05 0.3719259
#    30 40 0.45  0.05 0.4510800
#    30 40 0.50  0.05 0.5322896
#    30 40 0.55  0.05 0.6121937
#    30 40 0.60  0.05 0.6876059
#    30 40 0.65  0.05 0.7558815
#    30 40 0.70  0.05 0.8151817
#    30 40 0.75  0.05 0.8645929
#    30 40 0.80  0.05 0.9040910
#
#  NOTE: n1 and n2 are number in *each* group
#  URL: http://psychstat.org/ttest2n

#To plot a power curve:
plot(res, xvar='d', yvar='power') 



