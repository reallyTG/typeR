library(tigerstats)


### Name: proptestGC
### Title: Proportions Procedures
### Aliases: proptestGC

### ** Examples

data(m111survey)
#2-proportions, formula-data input, 95%-confidence interval only:
proptestGC(~sex+seat,data=m111survey,success="2_middle")

#For other confidence levels, use argument conf.level.  For 90%-interval for one proportion p:
proptestGC(~sex,data=m111survey,success="male",conf.level=0.90)

#one proportion, formula-data input, confidence interval and two-sided test with H_0:  p = 0.33:
proptestGC(~seat,data=m111survey,success="1_front",p=0.33)

#Summary data:
#In first sample, 23 successes out of 100 trials.  In second sample, 33 out of 110.
proptestGC(x=c(23,33),n=c(100,110))

#Summary data:
#In one sample, 40 successes in 100 trials.  Testing whether p = 0.45.
proptestGC(x=40,n=100,p=0.45,correct=TRUE)

#Want less output?  Set argument verbose to FALSE:
proptestGC(~sex+seat,data=m111survey,success="2_middle",p=0.33,verbose=FALSE)



