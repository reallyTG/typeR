library(mplot)


### Name: wallabies
### Title: Rock-wallabies data set
### Aliases: wallabies
### Keywords: datasets

### ** Examples

data(wallabies)
wdat = data.frame(subset(wallabies,select=-c(lat,long)), 
  EaD = wallabies$edible*wallabies$distance,
  EaS = wallabies$edible*wallabies$shelter,
  DaS = wallabies$distance*wallabies$shelter)
M1 = glm(rw~., family = binomial(link = "logit"), data = wdat)



