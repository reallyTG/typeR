library(MRQoL)


### Name: MCID
### Title: Determination of the Minimal Clinically Important Difference
###   (MCID)
### Aliases: MCID

### ** Examples

#Example 1: 
#Example to calculate the MCID without effect of Response Sift:
data(dataghs)
MCID(dataghs$GHS1,  dataghs$GHS0, dataghs$anchor1)


#Example 2: 
#Example to calculate the MCID with effect of Response Sift:

MCID(dataghs$GHS1,  dataghs$GHSr1, dataghs$anchor1)






