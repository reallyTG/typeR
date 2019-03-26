library(merTools)


### Name: REquantile
### Title: Identify group level associated with RE quantile
### Aliases: REquantile

### ** Examples

fm1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
REquantile(fm1, quantile = 0.25, groupFctr = "Subject")
REquantile(fm1, quantile = 0.25, groupFctr = "Subject", term = "Days")



