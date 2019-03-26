library(SampleSize4ClinicalTrials)


### Name: ssc
### Title: Sample Size Calculation for Mean and Proportion Comparisons in
###   Phase 3 Clinical Trials
### Aliases: ssc

### ** Examples

##Means comparison for continuous outcomes, a noninferiority trial with a noninferiority margin 0.5
##the true treatment difference is assumed to be zero in noninferiority and equivalence trials
ssc(cat="m",design=3,ratio=1,alpha=0.05,power=0.9,sigma=1,theta=0,delta=0.5)
##Proportions comparison for binary outcomes, a superiority trial
ssc(cat="p",design=2,ratio=3,alpha=0.025,power=0.8,p1=0.4,p2=0.2,theta=0.2)



