library(DesignLibrary)


### Name: factorial_designer
### Title: Create a factorial design
### Aliases: factorial_designer

### ** Examples


# A factorial design using default arguments
factorial_design <- factorial_designer()

# A 2 x 2 x 2 factorial design with unequal probabilities of assignment to 
# each treatment condition. In this case the estimator weights up by the 
# conditional probabilities of assignment.
factorial_design_2 <- factorial_designer(k = 3, 
                                         assignment_probs = c(1/2, 1/4, 1/8), 
                                         outcome_means = c(0,0,0,0,0,0,0,4))
## Not run: 
##D diagnose_design(factorial_design_2)
## End(Not run)
# Mapping from outcomes to estimands 
# The mapping between the potential outcomes schedule and the estimands of
# interest is not always easy. To help with intuition consider a 2^3 
# factorial design. You might like to think of a data generating process as
# a collection of marginal effects and interaction effects mapping from
# treatments to outcomes. 
# For instance: Y = -.25 + .75*X1 - .25*X2 -.25*X3 + X1*X2*X3
# The vector of implied potential outcome means as a function of conditions  
# could then be generated like this:

X <- expand.grid(rep(list(c(0,1)), 3))
outcome_means =  -.25 + X[,1]*3/4 - X[,2]/4 - X[,3]/4 + X[,1]*X[,2]*X[,3]
outcomes <- cbind(X, outcome_means)
colnames(outcomes) <- c("X1", "X2", "X3", "mean")
outcomes

# Examination of the outcomes in this table reveals that there is an 
# average outcome of 0 (over all conditions), an average effect of treatment
# X1 of 1,  an average effects for X2 and X3 of 0,  the two way interactions 
# are .5 (averaged over conditions of the third treatment) and the triple 
# interaction is 1.
# These are exactly the estimands calculated by the designer and returned in 
# diagnosis.
factorial_design_3 <- factorial_designer(k = 3, 
                                         outcome_means = outcome_means,
                                         outcome_sds = rep(.01, 8))
## Not run: 
##D library(DeclareDesign)
##D diagnose_design(factorial_design_3, sims = 10)
## End(Not run)





