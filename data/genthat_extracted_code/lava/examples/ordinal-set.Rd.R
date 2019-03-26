library(lava)


### Name: ordinal<-
### Title: Define variables as ordinal
### Aliases: ordinal<- ordinal

### ** Examples

if (requireNamespace("mets")) {
m <- lvm(y + z ~ x + 1*u[0], latent=~u)
ordinal(m, K=3) <- ~y+z
d <- sim(m, 100, seed=1)
e <- estimate(m, d)
}




