library(lavaSearch2)


### Name: setLink
### Title: Set a Link to a Value
### Aliases: setLink setLink.lvm

### ** Examples

library(lava)
set.seed(10)

m <- lvm()
regression(m) <- c(y1,y2,y3)~u
regression(m) <- u~x1+x2
latent(m) <- ~u
covariance(m) <- y1 ~ y2

m1 <- setLink(m, y3 ~ u, value = 1)
estimate(m1, lava::sim(m,1e2))
# m1 <- setLink(m, u ~ y3, value = 1)

m2 <- setLink(m, y1 ~ y2, value = 0.5)
estimate(m2, lava::sim(m,1e2))




