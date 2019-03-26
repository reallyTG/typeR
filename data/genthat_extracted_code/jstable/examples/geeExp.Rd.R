library(jstable)


### Name: geeExp
### Title: geeExp: transform the unit of coefficients (internal function)
### Aliases: geeExp

### ** Examples

 library(geepack)
 data(dietox)
 dietox$Cu <- as.factor(dietox$Cu)
 gee.uni <- geeUni("Weight", c("Time", "Cu"), data = dietox, id.vec = dietox$Pig, 
                   family = "gaussian", cor.type = "exchangeable")
 gee.exp <- geeExp(gee.uni, "binomial", 2)



