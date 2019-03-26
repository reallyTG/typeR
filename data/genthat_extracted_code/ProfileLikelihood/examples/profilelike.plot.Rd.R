library(ProfileLikelihood)


### Name: profilelike.plot
### Title: Profile Likelihood Plot
### Aliases: profilelike.plot

### ** Examples

ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- c(rep(0,10), rep(1,10))
weight <- c(ctl, trt)
dd <- data.frame(group=group, weight=weight)
xx <- profilelike.lm(formula = weight ~ 1, data=dd, profile.theta="group",
			lo.theta=-2, hi.theta=1, length=500)
profilelike.plot(theta=xx$theta, profile.lik.norm=xx$profile.lik.norm, round=2)
profilelike.summary(k=8, theta=xx$theta, profile.lik.norm=xx$profile.lik.norm, round=3)



