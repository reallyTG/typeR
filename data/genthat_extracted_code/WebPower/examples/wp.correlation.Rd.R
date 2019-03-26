library(WebPower)


### Name: wp.correlation
### Title: Statistical Power Analysis for Correlation
### Aliases: wp.correlation

### ** Examples

wp.correlation(n=50,r=0.3, alternative="two.sided")
#  Power for correlation
#
#     n   r alpha     power
#    50 0.3  0.05 0.5728731
#        
#  URL: http://psychstat.org/correlation

#To calculate the power curve with a sequence of sample sizes:
res <- wp.correlation(n=seq(50,100,10),r=0.3, alternative="two.sided")
res
#  Power for correlation
#
#      n   r alpha     power
#     50 0.3  0.05 0.5728731
#     60 0.3  0.05 0.6541956
#     70 0.3  0.05 0.7230482
#     80 0.3  0.05 0.7803111
#     90 0.3  0.05 0.8272250
#    100 0.3  0.05 0.8651692
#
#  URL: http://psychstat.org/correlation

#To plot the power curve:
plot(res, type='b')

#To estimate the sample size with a given power:
wp.correlation(n=NULL, r=0.3, power=0.8, alternative="two.sided")
#  Power for correlation
#
#           n   r alpha power
#    83.94932 0.3  0.05   0.8
#
#  URL: http://psychstat.org/correlation

#To estimate the minimum detectable effect size with a given power:
wp.correlation(n=NULL,r=0.3, power=0.8, alternative="two.sided")
#  Power for correlation
#
#           n   r alpha power
#    83.94932 0.3  0.05   0.8
#
#  URL: http://psychstat.org/correlation
#
#To calculate the power curve with a sequence of effect sizes:
res <- wp.correlation(n=100,r=seq(0.05,0.8,0.05), alternative="two.sided")
res
#	 Power for correlation
#
#      n    r alpha      power
#    100 0.05  0.05 0.07854715
#    100 0.10  0.05 0.16839833
#    100 0.15  0.05 0.32163978
#    100 0.20  0.05 0.51870091
#    100 0.25  0.05 0.71507374
#    100 0.30  0.05 0.86516918
#    100 0.35  0.05 0.95128316
#    100 0.40  0.05 0.98724538
#    100 0.45  0.05 0.99772995
#    100 0.50  0.05 0.99974699
#    100 0.55  0.05 0.99998418
#    100 0.60  0.05 0.99999952
#    100 0.65  0.05 0.99999999
#    100 0.70  0.05 1.00000000
#    100 0.75  0.05 1.00000000
#    100 0.80  0.05 1.00000000
#
#	 URL: http://psychstat.org/correlation



