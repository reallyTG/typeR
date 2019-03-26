library(WebPower)


### Name: wp.anova
### Title: Statistical Power Analysis for One-way ANOVA
### Aliases: wp.anova

### ** Examples

#To calculate the statistical power for the overall test of one-way ANOVA:
wp.anova(f=0.25,k=4, n=100, alpha=0.05)
#  Power for One-way ANOVA
#
#    k   n    f alpha     power
#    4 100 0.25  0.05 0.5181755
#
#  NOTE: n is the total sample size (overall)
#  URL: http://psychstat.org/anova

#To calculate the power curve with a sequence of sample sizes:
res <- wp.anova(f=0.25, k=4, n=seq(100,200,10), alpha=0.05)
res
#  Power for One-way ANOVA
#
#    k   n    f alpha     power
#    4 100 0.25  0.05 0.5181755
#    4 110 0.25  0.05 0.5636701
#    4 120 0.25  0.05 0.6065228
#    4 130 0.25  0.05 0.6465721
#    4 140 0.25  0.05 0.6837365
#    4 150 0.25  0.05 0.7180010
#    4 160 0.25  0.05 0.7494045
#    4 170 0.25  0.05 0.7780286
#    4 180 0.25  0.05 0.8039869
#    4 190 0.25  0.05 0.8274169
#    4 200 0.25  0.05 0.8484718
#
#  NOTE: n is the total sample size (overall)
#  URL: http://psychstat.org/anova

#To plot the power curve:
plot(res, type='b')

#To estimate the sample size with a given power:
wp.anova(f=0.25,k=4, n=NULL, alpha=0.05, power=0.8)
#  Power for One-way ANOVA
#
#    k        n    f alpha power
#    4 178.3971 0.25  0.05   0.8
#
#  NOTE: n is the total sample size (overall)
#  URL: http://psychstat.org/anova

#To estimate the minimum detectable effect size with a given power:
wp.anova(f=NULL,k=4, n=100, alpha=0.05, power=0.8)
#  Power for One-way ANOVA
#
#    k   n         f alpha power
#    4 100 0.3369881  0.05   0.8
#
#  NOTE: n is the total sample size (overall)
#  URL: http://psychstat.org/anova

#To conduct power analysis for a contrast one-way ANOVA:
wp.anova(f=0.25,k=4, n=100, alpha=0.05, type='two.sided')
#  Power for One-way ANOVA
#
#    k   n    f alpha     power
#    4 100 0.25  0.05 0.6967142
#
#  NOTE: n is the total sample size (contrast, two.sided)
#  URL: http://psychstat.org/anova

#To calculate the power curve with a sequence of sample sizes:
res <- wp.anova(f=seq(0.1, 0.8, 0.1), k=4, n=100, alpha=0.05)
res
#  Power for One-way ANOVA
#
#    k   n   f alpha     power
#    4 100 0.1  0.05 0.1128198
#    4 100 0.2  0.05 0.3452612
#    4 100 0.3  0.05 0.6915962
#    4 100 0.4  0.05 0.9235525
#    4 100 0.5  0.05 0.9911867
#    4 100 0.6  0.05 0.9995595
#    4 100 0.7  0.05 0.9999908
#    4 100 0.8  0.05 0.9999999
#
#  NOTE: n is the total sample size (overall)
#  URL: http://psychstat.org/anova



