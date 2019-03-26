library(kappalab)


### Name: ls.ranking.capa.ident
### Title: Least squares capacity identification in the framework of a
###   ranking procedure
### Aliases: ls.ranking.capa.ident
### Keywords: math

### ** Examples


arthur <- c(1, 1, 0.75, 0.25)
lancelot <- c(0.75, 0.75, 0.75, 0.75)
yvain <- c(1, 0.625, 0.5, 1)
perceval <- c(0.25, 0.5, 0.75, 0.75)
erec <- c(0.375, 1, 0.5 , 0.75)

P <- rbind(arthur, lancelot, yvain, perceval, erec)

# lancelot > erec; yvain > erec, erec > perceval, erec > arthur
rk.proto <- rbind(c("lancelot","erec"), c("yvain","erec"), c("erec","perceval"), c("erec","arthur"))

n<-4
k<-2
d<-0.1

## search for a capacity which satisfies the constraints
lrc <- ls.ranking.capa.ident(n ,k, P, rk.proto, d)

lrc




