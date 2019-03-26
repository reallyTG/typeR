library(lava)


### Name: regression<-
### Title: Add regression association to latent variable model
### Aliases: regression<- regression regression<-.lvm regression.lvm regfix
###   regfix<- regfix.lvm regfix<-.lvm
### Keywords: models regression

### ** Examples


m <- lvm() ## Initialize empty lvm-object
### E(y1|z,v) = beta1*z + beta2*v
regression(m) <- y1 ~ z + v
### E(y2|x,z,v) = beta*x + beta*z + 2*v + beta3*u
regression(m) <- y2 ~ f(x,beta) + f(z,beta)  + f(v,2) + u
### Clear restriction on association between y and
### fix slope coefficient of u to beta
regression(m, y2 ~ v+u) <- list(NA,"beta")

regression(m) ## Examine current linear parameter constraints

## ## A multivariate model, E(yi|x1,x2) = beta[1i]*x1 + beta[2i]*x2:
m2 <- lvm(c(y1,y2) ~ x1+x2)




