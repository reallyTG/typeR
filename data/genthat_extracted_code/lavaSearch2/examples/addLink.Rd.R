library(lavaSearch2)


### Name: addLink
### Title: Add a New Link Between Two Variables in a LVM
### Aliases: addLink addLink.lvm addLink.lvm.reduced

### ** Examples

library(lava)
set.seed(10)

m <- lvm()
regression(m) <- c(y1,y2,y3)~u
regression(m) <- u~x1+x2
latent(m) <- ~u
m2 <- m

addLink(m, x1 ~ y1, covariance = FALSE)
addLink(m, y1 ~ x1, covariance = FALSE)
coef(addLink(m, y1 ~ y2, covariance = TRUE))

addLink(m2, "x1", "y1", covariance = FALSE)
addLink(m2, "y1", "x1", covariance = FALSE)
newM <- addLink(m, "y1", "y2", covariance = TRUE)
coef(newM)




