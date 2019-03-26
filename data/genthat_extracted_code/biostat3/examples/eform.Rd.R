library(biostat3)


### Name: eform
### Title: Calculate the exponential form for coefficients and their
###   confidence intervals using either profile likelihood-based or
###   Wald-based confidence intervals.
### Aliases: eform eform.default irr or

### ** Examples

## from example(glm)
counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3, 1, 9); treatment <- gl(3, 3)
glm.D93 <- glm(counts ~ outcome + treatment, family = poisson())
eform(glm.D93) 
eform(glm.D93, method="Profile") 



