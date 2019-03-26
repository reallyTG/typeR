library(DesignLibrary)


### Name: two_arm_attrition_designer
### Title: Create design with risk of attrition or post treatment
###   conditioning
### Aliases: two_arm_attrition_designer

### ** Examples

# To make a design using default argument (missing completely at random):
two_arm_attrition_design <- two_arm_attrition_designer()
## Not run: 
##D diagnose_design(two_arm_attrition_design)
## End(Not run)
# Attrition can produce bias even for unconditional ATE even when not
# associated with treatment
## Not run: 
##D diagnose_design(two_arm_attrition_designer(b_R = 0, rho = .3))
## End(Not run)
# Here the linear estimate using R=1 data is unbiased for
# "ATE on Y (Given R)" with b_R = 0 but not when  b_R = 1   
## Not run: 
##D diagnose_design(redesign(two_arm_attrition_design, b_R = 0:1, rho = .2))
## End(Not run)



