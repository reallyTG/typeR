library(labdsv)


### Name: plot.pco
### Title: Plotting Routines For Principal Coordinates Ordinations
### Aliases: plot.pco points.pco plotid.pco hilight.pco chullord.pco
###   density.pco surf.pco thull.pco
### Keywords: hplot aplot iplot

### ** Examples

data(bryceveg)
data(brycesite)
dis.bc <- dsvdis(bryceveg,'bray/curtis')
pco.1 <- pco(dis.bc,5)
plot(pco.1)
points(pco.1,brycesite$elev>8000)
surf(pco.1,brycesite$elev)
## Not run: plotid(pco.1,ids=row.names(bryceveg))



