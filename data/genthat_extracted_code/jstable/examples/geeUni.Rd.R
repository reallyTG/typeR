library(jstable)


### Name: geeUni
### Title: geeUni: The coefficient of univariate gee (internal function)
### Aliases: geeUni

### ** Examples

 library(geepack)
 data(dietox)
 dietox$Cu <- as.factor(dietox$Cu)
 gee.uni <- geeUni("Weight", "Time", data = dietox, id.vec = dietox$Pig, 
                   family = "gaussian", cor.type = "exchangeable")



