library(ProfileLikelihood)


### Name: profilelike.polr
### Title: Profile Likelihood for Proportional Odds Models
### Aliases: profilelike.polr

### ** Examples

data(datapolr)
datapolr$y <- as.factor(datapolr$y)
xx <- profilelike.polr(y ~ x1 + x2, data=datapolr, profile.theta="group", 
				method="logistic", lo.theta=-2, hi.theta=2.5, length=500)
profilelike.plot(theta=xx$theta, profile.lik.norm=xx$profile.lik.norm, round=2)




