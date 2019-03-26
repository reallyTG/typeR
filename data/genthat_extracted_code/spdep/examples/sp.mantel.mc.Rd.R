library(spdep)


### Name: sp.mantel.mc
### Title: Mantel-Hubert spatial general cross product statistic
### Aliases: sp.mantel.mc plot.mc.sim
### Keywords: spatial

### ** Examples

data(oldcol)
sim1 <- sp.mantel.mc(COL.OLD$CRIME, nb2listw(COL.nb),
 nsim=99, type="geary", alternative="less")
sim1
plot(sim1)
sp.mantel.mc(COL.OLD$CRIME, nb2listw(COL.nb), nsim=99,
 type="sokal", alternative="less")
sp.mantel.mc(COL.OLD$CRIME, nb2listw(COL.nb), nsim=99,
 type="moran")



