library(coprimary)


### Name: nsurvival
### Title: Sample size calculation in clinical trials with one primary
###   survival endpoint
### Aliases: nsurvival

### ** Examples

#############################################################
###############  Design superiority:one-sided ###############
#############################################################
## 7-year survival rates Se=0.57 and Sc=0.53, alpha=0.05, accrual duration of 4 years, 
## study duration of 8 years and default values i.e power=0.80, pe=0.5, look=1, fup=0, 
## dropout=0, dqol=0
 
ns1 <- nsurvival(design=c(1,1),Survhyp=c(1,7,0.57,0.53),alpha=0.05,duraccrual=4,durstudy=8)

############################################################
############### Design superiority:two-sided ###############
############################################################
## 5-year rate without HRQoL deterioration Se=0.75 and Sc=0.65, alpha=c(0.04,0.01), accrual 
## duration of 2 years, study duration of 6 years, power=0.90, pe=0.55, follow-up 5 years, 
## 3 target variables for health related quality of life and default values i.e look=1, dropout=0

ns2 <- nsurvival(design=c(1,2),Survhyp=c(1,5,0.75,0.65),alpha=c(0.04,0.01),duraccrual=2,
durstudy=6,power=0.90,pe=0.55,fup=c(1,5),dqol=3)  

###########################################################
###############   Design non-inferiority ##################
###########################################################
## 5-year survival rates are equal under the alternative hypothesis, i.e Se=0.60 and Sc=SeA=0.70, 
## with alpha=0.05, accrual duration of 4 years, study duration of 8 years, two interim analysis 
## after the occurence 1/3 and 2/3 of the events and default values i.e power=0.80, pe=0.5, fup=0, 
## dropout=0, dqol=0 

ns3 <- nsurvival(design=c(2),Survhyp=c(1,5,0.60,0.70, 0.70),alpha=0.05,duraccrual=4,
durstudy=8,look=c(3,c(1,1),c(1/3,2/3)))

##########################################################
###############    Design superiority   ##################
##########################################################
## 3-year rate without HRQoL deterioration Sc=0.80 and log hazard equivalence margin delta=0.1 
## with alpha=0.10, accrual duration of 3 years, study duration of 5 years, drop out hazard rate 
## of 0.05 per arm, 2 target variables for health related quality of life and default values i.e 
## power=0.80, pe=0.5, look=1, fup=0

ns4 <- nsurvival(design=c(3),Survhyp=c(3,0.10,0.80),alpha=0.10,duraccrual=3,durstudy=5,
dropout=c(1,0.05,0.05),dqol=2)




