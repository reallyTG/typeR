library(WebPower)


### Name: wp.anova.binary
### Title: Statistical Power Analysis for One-way ANOVA with Binary Data
### Aliases: wp.anova.binary

### ** Examples

#To calculate the statistical power for one-way ANOVA (overall test) with binary data:
wp.anova.binary(k=4,n=100,V=0.15,alpha=0.05)
#  One-way Analogous ANOVA with Binary Data
#
#    k   n    V alpha     power
#    4 100 0.15  0.05 0.5723443
#
#  NOTE: n is the total sample size
#  URL: http://psychstat.org/anovabinary

#To generate a power curve given a sequence of sample sizes:
res <- wp.anova.binary(k=4,n=seq(100,200,10),V=0.15,alpha=0.05,power=NULL)
res
#  One-way Analogous ANOVA with Binary Data
#
#    k   n    V alpha     power
#    4 100 0.15  0.05 0.5723443
#    4 110 0.15  0.05 0.6179014
#    4 120 0.15  0.05 0.6601594
#    4 130 0.15  0.05 0.6990429
#    4 140 0.15  0.05 0.7345606
#    4 150 0.15  0.05 0.7667880
#    4 160 0.15  0.05 0.7958511
#    4 170 0.15  0.05 0.8219126
#    4 180 0.15  0.05 0.8451603
#    4 190 0.15  0.05 0.8657970
#    4 200 0.15  0.05 0.8840327
#
#  NOTE: n is the total sample size
#  URL: http://psychstat.org/anovabinary

#To plot the power curve:
plot(res) 

#To calculate the required sample size for one-way ANOVA (overall test) with binary data:
wp.anova.binary(k=4,n=NULL,V=0.15,power=0.8, alpha=0.05)
#  One-way Analogous ANOVA with Binary Data
#
#    k        n    V alpha power
#    4 161.5195 0.15  0.05   0.8
#
#  NOTE: n is the total sample size
#  URL: http://psychstat.org/anovabinary

#To calculate the minimum detectable effect size for one-way ANOVA (overall test) with binary data:
wp.anova.binary(k=4,n=100,V=NULL,power=0.8, alpha=0.05)
#  One-way Analogous ANOVA with Binary Data
#
#    k   n         V alpha power
#    4 100 0.1906373  0.05   0.8
#
#  NOTE: n is the total sample size
#  URL: http://psychstat.org/anovabinary

#To generate a power curve given a sequence of effect sizes:
wp.anova.binary(k=4,n=100,V=seq(0.1,0.5,0.05),alpha=0.05,power=NULL)
#  One-way Analogous ANOVA with Binary Data
#
#    k   n    V alpha     power
#    4 100 0.10  0.05 0.2746396
#    4 100 0.15  0.05 0.5723443
#    4 100 0.20  0.05 0.8402271
#    4 100 0.25  0.05 0.9659434
#    4 100 0.30  0.05 0.9961203
#    4 100 0.35  0.05 0.9997729
#    4 100 0.40  0.05 0.9999933
#    4 100 0.45  0.05 0.9999999
#    4 100 0.50  0.05 1.0000000
#
#  NOTE: n is the total sample size
#  URL: http://psychstat.org/anovabinary



