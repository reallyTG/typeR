library(coprimary)


### Name: ncoprimary
### Title: Sample size calculation in clinical trials with two co-primary
###   time-to-event endpoints
### Aliases: ncoprimary

### ** Examples


####################################################################################
############ Design superiority:one-sided with two co-primary endpoints ############
####################################################################################
## - For endpoint 1: 3-year survival rates Se=0.75 and Sc=0.65, alpha1=0.02
## - For endpoint 2: 4-year survival rates Se=0.70 and Sc=0.59, alpha2=0.03
## with accrual duration of 2 years, study duration of 4 years and default values i.e 
## power=0.80, pe=0.5, look=1, fup=0, dropout=0, dqol=0 

nc1 <- ncoprimary(design=c(1,1),Survhyp1=c(1,3,0.75,0.65),Survhyp2=c(1,4,0.70,0.59),
alpha1=0.02,alpha2=0.03,duraccrual=2,durstudy=4)


#####################################################################################
 ############ Design superiority:two-sided with two co-primary endpoints ############
#####################################################################################
## - For endpoint 1: 2 target variables for the health related quality of life with 3-year 
## rate without HRQoL deterioration Se=0.75 and Sc=0.67, alpha1=c(0.01,0.01)
## - For endpoint 2: 4-year survival rates Se=0.86 and Sc=0.80, alpha2=c(0.015,0.015)
## with accrual duration of 3 years, study duration of 6 years, power=0.90, look=c(2,c(1,1),0.5), 
## and default values i.e  pe=0.5, fup=0, dropout=0

nc2 <- ncoprimary(design=c(1,2),Survhyp1=c(1,5,0.75,0.67),Survhyp2=c(1,5,0.86,0.80),
alpha1=c(0.01,0.01),alpha2=c(0.015,0.015),duraccrual=3,durstudy=6, power=0.90,
look=c(2,c(1,1),0.5),dqol=2)


#####################################################################################
##############  Design non-inferiority with two co-primary endpoints ################
#####################################################################################
## - For endpoint 1: 3-year survival rates Se=0.75 and Sc=SeA=0.75, alpha1=0.01
## - For endpoint 2: 4-year survival rates Se=0.67 and Sc=SeA=0.80, alpha2=0.04
## with accrual duration of 2 years, study duration of 6 years, power=0.95, pe=0.60 and 
## default values i.e look=1, fup=0, dropout=0, dqol=0

nc3 <- ncoprimary(design=c(2),Survhyp1=c(1,4,0.65,0.75,0.75),Survhyp2=c(1,5,0.67,0.80,0.80),
alpha1=0.01,alpha2=0.04,duraccrual=2,durstudy=6,power=0.95,pe=0.60)

####################################################################################
################  Design superiority with two co-primary endpoints ################# 
####################################################################################

## - For endpoint 1: 2-year survival rate Sc=0.65 and log hazard equivalence margin delta=0.15 
## and alpha1=0.025
## - For endpoint 2: 1-year survival rate Sc=0.70 and log hazard equivalence margin delta=0.10 
## and alpha2=0.025
## with accrual duration of 3 years, study duration of 5 years, drop out hazard rate of 0.025 
## per arm and default values i.e power=0.80, pe=0.5, look=1, fup=0, dqol=0 

nc4 <- ncoprimary(design=c(3),Survhyp1=c(2,0.15,0.65),Survhyp2=c(1,0.10,0.70),alpha1=0.025,
alpha2=0.025,duraccrual=3,durstudy=5,dropout=c(1,0.025,0.025))





