library(lavaSearch2)


### Name: checkData
### Title: Check that Validity of the Dataset
### Aliases: checkData checkData.lvm

### ** Examples

m <- lvm()
regression(m) <- c(y1,y2,y3)~u
regression(m) <- u~x
latent(m) <- ~u

d <- lava::sim(m,1e2)

try(checkData(m, data = d)) # return an error

checkData(m, data = d[,-4])

try(checkData(m, data = d[,-(3:4)])) # return an error




