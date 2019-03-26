library(geepack)


### Name: dietox
### Title: Growth curves of pigs in a 3x3 factorial experiment
### Aliases: dietox
### Keywords: datasets

### ** Examples

data(dietox)
dietox$Cu     <- as.factor(dietox$Cu)
gee01 <- geeglm (Weight ~ Time + Cu + Cu * Time, id =Pig, data = dietox,
         family=gaussian,corstr="ex")

mf <- formula(Weight~Cu*(Time+I(Time^2)+I(Time^3)))
gee1 <- geeglm(mf, data=dietox, id=Pig, family=poisson("identity"),corstr="ar1")
summary(gee1)
anova(gee1)




