library(GLMMRR)


### Name: RRglm
### Title: Fitting Generalized Linear Models with binary Randomized
###   Response data
### Aliases: RRglm

### ** Examples

# Fit the model with fixed effects for gender, RR, pp and age using the logit link function.
# The Randomized Response parameters p1, p2 and model
# are specified for each observation in the dataset.
out <- RRglm(response ~ Gender + RR + pp + age, link="RRlink.logit", RRmodel=RRmodel,
         p1=RRp1, p2=RRp2, data=Plagiarism, etastart=rep(0.01, nrow(Plagiarism)))
summary(out)



