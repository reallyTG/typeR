library(ProfileLikelihood)


### Name: profilelike.lme
### Title: Profile Likelihood for Linear Mixed-Effects Models
### Aliases: profilelike.lme

### ** Examples

xx <- profilelike.lme(formula = yield ~ endpoint, random = ~ 1 | id, 
		correlation=corAR1(form = ~ 1 | id), data=Gasoline, subject="Sample", 
		profile.theta="vapor", method="ML", lo.theta=1, hi.theta=5, length=500, round=2)
profilelike.plot(theta=xx$theta, profile.lik.norm=xx$profile.lik.norm, round=4)



