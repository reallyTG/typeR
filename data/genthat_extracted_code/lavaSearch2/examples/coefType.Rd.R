library(lavaSearch2)


### Name: coefType
### Title: Extract the Type of Each Coefficient
### Aliases: coefType coefType.lvm coefType.lvmfit coefType.multigroup

### ** Examples

#### regression ####
m <- lvm(Y~X1+X2)
e <- estimate(m, lava::sim(m, 1e2))

coefType(m)
coefType(e)

#### LVM ####
m <- lvm()
regression(m) <- c(y1,y2,y3)~u
regression(m) <- u~x1+x2
latent(m) <- ~u
covariance(m) <- y1~y2

m.Sim <- m
categorical(m.Sim, labels = c("a","b","c")) <- ~x2
e <- estimate(m, lava::sim(m.Sim, 1e2))

coefType(m)
coefType(e)

## additional categorical variables 
categorical(m, labels = as.character(1:3)) <- "X1"

coefType(m, as.lava = FALSE)

#### LVM with constrains ####
m <- lvm(c(Y1~0+1*eta1,Y2~0+1*eta1,Y3~0+1*eta1,
          Z1~0+1*eta2,Z2~0+1*eta2,Z3~0+1*eta2))
latent(m) <- ~eta1 + eta2
e <- estimate(m, lava::sim(m,1e2))

coefType(m)
coefType(e)

#### multigroup ####
m <- lvm(Y~X1+X2)
eG <- estimate(list(m,m), list(lava::sim(m, 1e2), lava::sim(m, 1e2)))
coefType(eG)




