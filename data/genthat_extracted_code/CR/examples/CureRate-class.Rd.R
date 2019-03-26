library(CR)


### Name: CureRate-class
### Title: Class '"CureRate"'
### Aliases: CureRate-class CR-CureRate-method
### Keywords: classes

### ** Examples

showClass("CureRate")

## Input Data
###############
# rho - specifies the value of rho in the G-rho test (Harrington and Fleming, 1982). 
# rho = 0 gives the logrank test, and rho = 1 the Peto-Peto Wilcoxon test
#(and rho = -1 the test discussed by Gray and Tsiatis, 1989).
rho = 0 

numreps = 500
##cureobs - probability of cure on the observation arm of the study
cureobs = .359
##curerx - probability of cure on the treatment arm of the study
curerx = .459
##medobs - median survival among the non-cured on observation
medobs = .747
##medrx - median survival among the non-cured on treatment
medrx = .859
##acrate - rate at which patients accrue, combined over both 
##observation and treatment arms of the study
acrate = 232
##probrx - probability of assignment to the treatment arm
probrx = .5
##actime  - accrual duration
actime = c(3.3, 3.5, 3.8); 
##futime  - followup duration
futime = c(2.0,  2.5) 
##info - vector of information times for the interim looks
##must be an increasing sequence in (0,1]
info = c( .35, .61, .86, 1.0)
##crits - vector of critical values corresponding to the 
##interim analysis time points specified in info
crits = c(3.6128, 2.6506, 2.1894, 2.0536)
##############################################################

### Log-rank test: rho=0 (default)
mycr<-curerate(rho ,numreps,cureobs,curerx,medobs,medrx,acrate,
          probrx,actime,futime,info,crits)
mycr       ### (*)

show(mycr)   ### same as above
showcr(mycr)   ### same as above
unclass(mycr)
showcr(mycr,full.results=TRUE)
showcr(mycr,indac=3,indfu=1)



