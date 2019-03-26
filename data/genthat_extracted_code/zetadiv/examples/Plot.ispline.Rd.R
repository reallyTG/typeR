library(zetadiv)


### Name: Plot.ispline
### Title: Plotting splines from I-spline-based multi-site generalised
###   dissimilarity modelling
### Aliases: Plot.ispline

### ** Examples


utils::data(Marion.species)
xy.marion <- Marion.species[1:2]
data.spec.marion <- Marion.species[3:33]

utils::data(Marion.env)
data.env.marion <- Marion.env[3]

zeta.ispline <- Zeta.msgdm(data.spec.marion, data.env.marion, xy.marion, sam = 100,
    order = 3, normalize = "Jaccard", reg.type = "ispline")
zeta.ispline
dev.new()
Plot.ispline(zeta.ispline, data.env.marion, distance = TRUE)




