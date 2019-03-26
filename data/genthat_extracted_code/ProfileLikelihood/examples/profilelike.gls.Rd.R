library(ProfileLikelihood)


### Name: profilelike.gls
### Title: Profile Likelihood for Linear Models for Longitudinal Responses
###   Fitted by Generalized Least Squares
### Aliases: profilelike.gls

### ** Examples

xx <- profilelike.gls(formula=yield ~ endpoint, correlation=corAR1(form = ~ 1 | id),
	data=Gasoline, subject="Sample", profile.theta="vapor", method="ML", 
	lo.theta=1, hi.theta=5, length=500, round=2)
profilelike.plot(theta=xx$theta, profile.lik.norm=xx$profile.lik.norm, round=4)



