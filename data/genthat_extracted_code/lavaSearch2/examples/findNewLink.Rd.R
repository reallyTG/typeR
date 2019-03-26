library(lavaSearch2)


### Name: findNewLink
### Title: Find all New Links Between Variables
### Aliases: findNewLink findNewLink.lvm

### ** Examples

library(lava)

m <- lvm()
regression(m) <- c(y1,y2,y3)~u
categorical(m,labels=c("M","F","MF")) <- ~X1
findNewLink(m, rm.endo = FALSE)
findNewLink(m, rm.endo = TRUE)
findNewLink(m, exclude.var = "X1")

regression(m) <- u~x1+x2
latent(m) <- ~u

findNewLink(m, rm.endo = FALSE)
findNewLink(m, rm.endo = TRUE)
findNewLink(m, rm.endo = TRUE, output = "index")
findNewLink(m, type = "covariance")
findNewLink(m, type = "regression")




