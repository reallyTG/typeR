library(lava)


### Name: iid
### Title: Extract i.i.d. decomposition (influence function) from model
###   object
### Aliases: iid iid.default

### ** Examples

m <- lvm(y~x+z)
distribution(m, ~y+z) <- binomial.lvm("logit")
d <- sim(m,1e3)
g <- glm(y~x+z,data=d,family=binomial)
crossprod(iid(g))




