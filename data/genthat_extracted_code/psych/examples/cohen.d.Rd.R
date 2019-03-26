library(psych)


### Name: cohen.d
### Title: Find Cohen d and confidence intervals
### Aliases: cohen.d d.robust cohen.d.ci d.ci cohen.d.by d2r r2d d2t t2d
###   m2t
### Keywords: models multivariate

### ** Examples

cohen.d(sat.act,"gender")
cd <- cohen.d.by(sat.act,"gender","education")
summary(cd)  #summarize the output

#now show several examples of confidence intervals
#one group (d vs 0)
#consider the t from the cushny data set
t2d( -4.0621,n1=10)
d.ci(-1.284549,n1=10)  #the confidence interval of the effect of drug on sleep
#two groups
d.ci(.62,n=64)  #equal group size
d.ci(.62,n1=35,n2=29) #unequal group size





