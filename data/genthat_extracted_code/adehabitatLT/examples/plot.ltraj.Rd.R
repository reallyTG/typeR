library(adehabitatLT)


### Name: plot.ltraj
### Title: Graphical Display of an Object of Class "ltraj"
### Aliases: plot.ltraj
### Keywords: spatial hplot

### ** Examples


data(puechcirc)

plot(puechcirc)
plot(puechcirc, perani = FALSE)
plot(puechcirc, id = "JE93", perani = FALSE)

data(puechabonsp)
plot(puechcirc, perani = FALSE, spixdf = puechabonsp$map[,1])

cont <- getcontour(puechabonsp$map[,1])
plot(puechcirc, spoldf = cont)




