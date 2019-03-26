library(survival)


### Name: cipoisson
### Title: Confidence limits for the Poisson
### Aliases: cipoisson

### ** Examples

cipoisson(4) # 95% confidence limit 
# lower    upper  
# 1.089865 10.24153 
ppois(4, 10.24153)     #chance of seeing 4 or fewer events with large rate  
# [1] 0.02500096 
1-ppois(3, 1.08986)    #chance of seeing 4 or more, with a small rate 
# [1] 0.02499961




