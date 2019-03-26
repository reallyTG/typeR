library(jstable)


### Name: geeglm.display
### Title: geeglm.display
### Aliases: geeglm.display

### ** Examples

 library(geepack)
 data(dietox)
 dietox$Cu <- as.factor(dietox$Cu)
 gee01 <- geeglm (Weight ~ Time + Cu , id =Pig, data = dietox,
                family=gaussian,corstr="ex")
 geeglm.display(gee01)



