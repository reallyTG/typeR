library(CAMAN)


### Name: leukDat
### Title: Childhood leukemia in the former GDR
### Aliases: leukDat GDRmap
### Keywords: datasets

### ** Examples

## disease mapping example
data(leukDat)
data(GDRmap) # this is the map of the former GDR
mix.leuk <- mixalg(obs = "oleuk", pop.at.risk = "eleuk",
                   data = leukDat, family = "poisson")
mix.leuk
plot(GDRmap, col = mix.leuk@classification)          



