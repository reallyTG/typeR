library(Ecdat)


### Name: HHSCyberSecurityBreaches
### Title: Cybersecurity breaches reported to the US Department of Health
###   and Human Services
### Aliases: HHSCyberSecurityBreaches
### Keywords: datasets

### ** Examples

##
## 1.  mean(Individuals.Affected)
##
mean(HHSCyberSecurityBreaches$Individuals.Affected)
##
## 2.  Basic Breach Types
##
tb <- as.character(HHSCyberSecurityBreaches$Type.of.Breach)
tb. <- strsplit(tb, ', ')
table(unlist(tb.))
# 8 levels, but two are the same apart from 
# a trailing blank.  
##
## 3.  Location.of.Breached.Information 
##
lb <- as.character(HHSCyberSecurityBreaches[[
          'Location.of.Breached.Information']])
table(lb)
lb. <- strsplit(lb, ', ')
table(unlist(lb.))
# 8 levels 
table(sapply(lb., length))
#   1    2    3    4    5    6    7    8 
#1007  119   13    8    1    1    1    1 
# all 8 levels together observed once 
# There are 256 = 2^8 possible combinations 
# of which 47 actually occur in these data.  



