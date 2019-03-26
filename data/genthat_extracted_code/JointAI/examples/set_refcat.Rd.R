library(JointAI)


### Name: set_refcat
### Title: Set the reference categories for all categorical covariates in
###   the model
### Aliases: set_refcat

### ** Examples

## Not run: 
##D # Example 1: set reference categories for the whole dataset and choose answer option 3:
##D set_refcat(data = NHANES)
##D 3
##D 
##D # insert the returned string as argument refcats
##D mod1 <- lm_imp(SBP ~ age + race + creat + educ, data = NHANES, refcats = 'largest')
##D 
##D # Example 2:
##D # specify a model formula
##D fmla <- SBP ~ age + gender + race + bili + smoke + alc
##D 
##D # write the output of set_refcat to an object
##D ref_mod2 <- set_refcat(data = NHANES, formula = fmla)
##D 4
##D 2
##D 5
##D 1
##D 1
##D 
##D # enter the output in the model specification
##D mod2 <- lm_imp(formula = fmla, data = NHANES, refcats = ref_mod2, n.adapt = 0)
## End(Not run)




