library(WebPower)


### Name: wp.rmanova
### Title: Statistical Power Analysis for Repeated Measures ANOVA
### Aliases: wp.rmanova

### ** Examples

## No test: 
#To calculate the statistical power for repeated-measures ANOVA:
wp.rmanova(n=30, ng=3, nm=4, f=0.36, nscor=0.7)
#  Repeated-measures ANOVA analysis
#
#    n    f ng nm nscor alpha     power
#    30 0.36  3  4   0.7  0.05 0.2674167
#
#  NOTE: Power analysis for between-effect test
#  URL: http://psychstat.org/rmanova

#To generate a power curve given a sequence of sample sizes:
wp.rmanova(n=seq(30,150,20), ng=3, nm=4, f=0.36, nscor=0.7)
#  Repeated-measures ANOVA analysis
#
#      n    f ng nm nscor alpha     power
#     30 0.36  3  4   0.7  0.05 0.2674167
#     50 0.36  3  4   0.7  0.05 0.4386000
#     70 0.36  3  4   0.7  0.05 0.5894599
#     90 0.36  3  4   0.7  0.05 0.7110142
#    110 0.36  3  4   0.7  0.05 0.8029337
#    130 0.36  3  4   0.7  0.05 0.8691834
#    150 0.36  3  4   0.7  0.05 0.9151497
#
#  NOTE: Power analysis for between-effect test
#  URL: http://psychstat.org/rmanova

#To plot the power curve:
plot(res)

#To calculate the required sample size given power and effect size:
wp.rmanova(n=NULL, ng=3, nm=4, f=0.36, power=0.8, nscor=0.7)
#  Repeated-measures ANOVA analysis
#
#           n    f ng nm nscor alpha power
#    109.2546 0.36  3  4   0.7  0.05   0.8
#
#  NOTE: Power analysis for between-effect test
#  URL: http://psychstat.org/rmanova

#To calculate the minimum detectable effect size given power and sample size:
wp.rmanova(n=30, ng=3, nm=4, f=NULL, power=0.8, nscor=0.7)
#  Repeated-measures ANOVA analysis
#
#     n        f ng nm nscor alpha power
#    30 0.716768  3  4   0.7  0.05   0.8
#
#  NOTE: Power analysis for between-effect test
#  URL: http://psychstat.org/rmanova

# To generate a power curve given a sequence of effec sizes:
wp.rmanova(n=30, ng=3, nm=4, f=seq(0.1,0.5,0.05), nscor=0.7)
#  Repeated-measures ANOVA analysis
#
#     n    f ng nm nscor alpha      power
#    30 0.10  3  4   0.7  0.05 0.06442235
#    30 0.15  3  4   0.7  0.05 0.08327886
#    30 0.20  3  4   0.7  0.05 0.11101678
#    30 0.25  3  4   0.7  0.05 0.14853115
#    30 0.30  3  4   0.7  0.05 0.19640404
#    30 0.35  3  4   0.7  0.05 0.25460008
#    30 0.40  3  4   0.7  0.05 0.32223192
#    30 0.45  3  4   0.7  0.05 0.39746082
#    30 0.50  3  4   0.7  0.05 0.47757523
#
#  NOTE: Power analysis for between-effect test
#  URL: http://psychstat.org/rmanova
## End(No test)




