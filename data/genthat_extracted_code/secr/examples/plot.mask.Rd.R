library(secr)


### Name: plot.mask
### Title: Plot Habitat Mask, Density or Resource Surface
### Aliases: plot.mask plot.Dsurface plot.Rsurface spotHeight
### Keywords: hplot

### ** Examples


# simple

temptrap <- make.grid()
tempmask <- make.mask(temptrap)
plot (tempmask)

## restrict to points over an arbitrary detection threshold,
## add covariate, plot image and overlay traps

tempmask <- subset(tempmask, pdot(tempmask, temptrap,
    noccasions = 5)>0.001)
covariates (tempmask) <- data.frame(circle = 
    exp(-(tempmask$x^2 + tempmask$y^2)/10000) )
plot (tempmask, covariate = "circle", dots = FALSE, axes = TRUE, 
    add = TRUE, breaks = 8, col = terrain.colors(8), mesh = NA)
plot (temptrap, add = TRUE)

## add a legend
par(cex = 0.9)
covrange <- range(covariates(tempmask)$circle)
step <- diff(covrange)/8
colourlev <- terrain.colors(9)
zlev <- format(round(seq(covrange[1],covrange[2],step),2))
legend (x = "topright", fill = colourlev, legend = zlev, 
    y.intersp = 0.8, title = "Covariate")

title("Colour mask points with p.(X) > 0.001")
mtext(side=3,line=-1, "g0 = 0.2, sigma = 20, nocc = 5")

## Not run: 
##D 
##D ## Waitarere possum density surface extrapolated across region
##D 
##D regionmask <- make.mask(traps(possumCH), buffer = 1000, spacing = 10,
##D     poly = possumremovalarea)
##D dts <- distancetotrap(regionmask, possumarea)
##D covariates(regionmask) <- data.frame(d.to.shore = dts)
##D shorePossums <- predictDsurface(possum.model.Ds, regionmask)
##D 
##D ## plot as coloured pixels with white lines
##D colourlev <- terrain.colors(7)
##D plot(shorePossums, breaks = seq(0,3.5,0.5), plottype = "shaded",
##D     poly = FALSE, col = colourlev, mesh = NA)
##D plot(traps(possumCH), add = TRUE, detpar = list(col = "black"))
##D polygon(possumremovalarea)
##D 
##D ## check some point densities
##D spotHeight(shorePossums, dec = 1, col = "black")
##D 
##D ## add a legend
##D zlev <- format(seq(0,3,0.5), digits = 1)
##D legend (x = "topright", fill = colourlev, legend =
##D     paste(zlev,"--"), y.intersp = 1, title = "Density / ha")
## End(Not run)




