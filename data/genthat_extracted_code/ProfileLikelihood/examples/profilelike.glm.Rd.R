library(ProfileLikelihood)


### Name: profilelike.glm
### Title: Profile Likelihood for Generalized Linear Models
### Aliases: profilelike.glm

### ** Examples

data(dataglm)
xx <- profilelike.glm(y ~ x1 + x2, data=dataglm, profile.theta="group", 
				family=binomial(link="logit"), length=500, round=2)
profilelike.plot(theta=xx$theta, profile.lik.norm=xx$profile.lik.norm, round=2)



