library(lava)


### Name: Missing
### Title: Missing value generator
### Aliases: Missing Missing, Missing<-

### ** Examples

library(lava)
set.seed(17)
m <- lvm(y0~x01+x02+x03)
m <- Missing(m,formula=x1~x01,Rformula=R1~0.3*x02+-0.7*x01,p=0.4)
sim(m,10)


m <- lvm(y~1)
m <- Missing(m,"y","r")
## same as
## m <- Missing(m,y~1,r~1)
sim(m,10)

## same as
m <- lvm(y~1)
Missing(m,"y") <- r~x
sim(m,10)

m <- lvm(y~1)
m <- Missing(m,"y","r",suffix=".")
## same as
## m <- Missing(m,"y","r",missing.name="y.")
## same as
## m <- Missing(m,y.~y,"r")
sim(m,10)




