library(jstable)


### Name: LabeljsGeeglm
### Title: LabeljsGeeglm: Apply label information to geeglm.display object
###   using label data
### Aliases: LabeljsGeeglm

### ** Examples

 library(geepack);library(jstable)
 data(dietox)
 dietox$Cu <- as.factor(dietox$Cu)
 gee01 <- geeglm (Weight ~ Time + Cu , id =Pig, data = dietox,
                family=gaussian,corstr="ex")
 g1 <- geeglm.display(gee01)
 LabeljsGeeglm(g1, ref = mk.lev(dietox))



