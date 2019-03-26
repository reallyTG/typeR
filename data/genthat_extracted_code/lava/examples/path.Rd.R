library(lava)


### Name: path
### Title: Extract pathways in model graph
### Aliases: path effects path.lvm effects.lvmfit totaleffects
### Keywords: graphs methods models

### ** Examples


m <- lvm(c(y1,y2,y3)~eta)
regression(m) <- y2~x1
latent(m) <- ~eta
regression(m) <- eta~x1+x2
d <- sim(m,500)
e <- estimate(m,d)

path(Model(e),y2~x1)
parents(Model(e), ~y2)
children(Model(e), ~x2)
children(Model(e), ~x2+eta)
effects(e,y2~x1)
## All simple paths (undirected)
path(m,y1~x1,all=TRUE)




