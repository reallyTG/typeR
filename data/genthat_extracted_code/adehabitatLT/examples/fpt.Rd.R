library(adehabitatLT)


### Name: fpt
### Title: Computation of the First Passage Time From Trajectories
### Aliases: fpt plot.fipati varlogfpt meanfpt
### Keywords: spatial

### ** Examples


data(puechcirc)
i <- fpt(puechcirc, seq(300,1000, length=30))
plot(i, scale = 500, warn = FALSE)

toto <- meanfpt(i)
toto
attr(toto, "radii")


toto <- varlogfpt(i)
toto
attr(toto, "radii")





