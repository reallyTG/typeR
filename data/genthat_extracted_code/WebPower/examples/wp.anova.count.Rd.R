library(WebPower)


### Name: wp.anova.count
### Title: Statistical Power Analysis for One-way ANOVA with Count Data
### Aliases: wp.anova.count

### ** Examples

## No test: 
#To calculate the statistical power for one-way ANOVA (overall test) with count data:
wp.anova.count(k=4,n=100,V=0.148,alpha=0.05)
#  One-way Analogous ANOVA with Count Data
#
#    k   n     V alpha     power
#    4 100 0.148  0.05 0.5597441
#
#  NOTE: n is the total sample size
#  URL: http://psychstat.org/anovacount

#To generate a power curve given sequence of sample sizes:
res <- wp.anova.count(k=4,n=seq(100,200,10),V=0.148,alpha=0.05,power=NULL)
res
#  One-way Analogous ANOVA with Count Data
#
#		k   n     V alpha     power
#		4 100 0.148  0.05 0.5597441
#		4 110 0.148  0.05 0.6049618
#		4 120 0.148  0.05 0.6470911
#		4 130 0.148  0.05 0.6860351
#		4 140 0.148  0.05 0.7217782
#		4 150 0.148  0.05 0.7543699
#		4 160 0.148  0.05 0.7839101
#		4 170 0.148  0.05 0.8105368
#		4 180 0.148  0.05 0.8344142
#		4 190 0.148  0.05 0.8557241
#		4 200 0.148  0.05 0.8746580
#
#  NOTE: n is the total sample size
#  URL: http://psychstat.org/anovacount

#To plot the power curve:
plot(res)

#To calculate the required sample size for one-way ANOVA (overall test) with count data:
wp.anova.count(k=4,n=NULL,V=0.148,power=0.8, alpha=0.05)
#  One-way Analogous ANOVA with Count Data
#
#    k        n     V alpha power
#    4 165.9143 0.148  0.05   0.8
#
#  NOTE: n is the total sample size
#  URL: http://psychstat.org/anovacount

#To calculate the minimum detectable effect size for one-way ANOVA (overall test) with count data:
wp.anova.count(k=4,n=100,V=NULL,power=0.8, alpha=0.05)
#  One-way Analogous ANOVA with Count Data
#
#    k   n         V alpha power
#    4 100 0.1906373  0.05   0.8
#
#  NOTE: n is the total sample size
#  URL: http://psychstat.org/anovacount

#To generate a power curve given a sequence of effect sizes:
res <- wp.anova.count(k=5,n=100,V=seq(0.1,0.5,0.05),alpha=0.05,power=NULL)
res
#  One-way Analogous ANOVA with Count Data
#
#    k   n    V alpha     power
#    5 100 0.10  0.05 0.3200744
#    5 100 0.15  0.05 0.6634861
#    5 100 0.20  0.05 0.9118531
#    5 100 0.25  0.05 0.9893643
#    5 100 0.30  0.05 0.9994549
#    5 100 0.35  0.05 0.9999887
#    5 100 0.40  0.05 0.9999999
#    5 100 0.45  0.05 1.0000000
#    5 100 0.50  0.05 1.0000000
#
#  NOTE: n is the total sample size
#  URL: http://psychstat.org/anovacount
## End(No test)




