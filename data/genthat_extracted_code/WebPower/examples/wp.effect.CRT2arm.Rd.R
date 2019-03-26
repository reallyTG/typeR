library(WebPower)


### Name: wp.effect.CRT2arm
### Title: Effect size calculatator based on raw data for Cluster
###   Randomized Trials with 2 Arms
### Aliases: wp.effect.CRT2arm

### ** Examples

## No test: 
#Empirical data set CRT2:
CRT2
#ID cluster score group
#1 1 6 0
#2 1 2 0
#3 2 6 1
#4 2 5 1
#5 3 1 0
#6 3 4 0
#7 4 6 1
#8 4 4 1

#To calculate the effect size and ICC based on empirical data
wp.effect.CRT2arm (CRT2)
#  Effect size for CRT2arm
#  
#         f  ICC
#  1.264911 -0.5
#  
#  NOTE: f is the effect size.
#  URL: http://psychstat.org/crt2arm
## End(No test)




