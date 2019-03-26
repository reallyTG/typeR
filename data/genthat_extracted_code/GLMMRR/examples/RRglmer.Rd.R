library(GLMMRR)


### Name: RRglmer
### Title: Fitting Generalized Linear Mixed-Effects Models with binary
###   Randomized Response data
### Aliases: RRglmer

### ** Examples

# Fit the model with fixed effects for gender, RR and pp
# and a random effect for age using the logit link function.
# The Randomized Response parameters p1, p2 and model
# are specified for each observation in the dataset.
out <- RRglmer(response ~ Gender + RR + pp + (1|age), link="RRlink.logit", RRmodel=RRmodel,
         p1=RRp1, p2=RRp2, data=Plagiarism, na.action = "na.omit",
         etastart = rep(0.01, nrow(Plagiarism)),
         control = glmerControl(optimizer = "Nelder_Mead", tolPwrss = 1e-03), nAGQ = 1)
summary(out)



