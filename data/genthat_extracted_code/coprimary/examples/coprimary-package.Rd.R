library(coprimary)


### Name: coprimary-package
### Title: Sample size calculation for two primary time-to-event endpoints
###   in phase III clinical trials
### Aliases: coprimary-package coprimary
### Keywords: sample size multiple endpoints co-primary clinical trial

### ** Examples


#####################################################################################
############ Design superiority: two-sided with two co-primary endpoints ############
#####################################################################################
## - For endpoint 1: 2 target variables for the health related quality of life with 3-year 
## rate without HRQoL deterioration Se=0.75 and Sc=0.67, alpha1=c(0.01,0.01)
## - For endpoint 2: 4-year survival rates Se=0.86 and Sc=0.80, alpha2=c(0.015,0.015)
## - with accrual duration of 3 years, study duration of 6 years, power=0.90, 
## look=c(2,c(1,1),0.5), and default values i.e  pe=0.5, fup=0, dropout=0

nc1 <- ncoprimary(design=c(1,2),Survhyp1=c(1,5,0.75,0.67),Survhyp2=c(1,5,0.86,0.80),
alpha1=c(0.01,0.01),alpha2=c(0.015,0.015),duraccrual=3,durstudy=6,power=0.90,
look=c(2,c(1,1),0.5),dqol=2)


#####################################################################################
############ Design superiority: one-sided with two co-primary endpoints ############
#####################################################################################
## - For endpoint 1: 2-year hazard ratio hype=0.86 and Sc=0.62, alpha1=0.05
## - For endpoint 2: 3-year survival rates hype=0.81 and Sc=0.57, alpha2=0.05
## - with accrual duration of 2 years, study duration of 10 years and default values i.e
## power=0.90, pe=0.5, look=1, fup=0, dropout=0, dqol=0


nc2 <- ncoprimary(design=c(1,1),Survhyp1=c(2,2,0.86,0.62),Survhyp2=c(2,3,0.81,0.57),
alpha1=0.05,alpha2=0.05,duraccrual=2,durstudy=10)

#####################################################################################
###############   Design non-inferiority with one primary endpoint ##################
#####################################################################################
## 5-year rate without HRQoL deterioration are equal under the alternative hypothesis, 
## i.e Se=0.60 and Sc=SeA=0.70, with alpha=0.05, accrual duration of 4 years,study duration 
## of 8 years, two interim analysis after the occurence 1/3 and 2/3 of the events, 3 target 
## variables for the health related quality of life and default values i.e power=0.80, pe=0.5, 
## fup=0, dropout=0

ns <- nsurvival(design=c(2),Survhyp=c(1,5,0.60,0.70, 0.70),alpha=0.05,duraccrual=4,
durstudy=8,look=c(3,c(1,1),c(1/3,2/3)), dqol=3)




