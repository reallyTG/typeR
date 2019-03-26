library(surveillance)


### Name: twinstim_intensity
### Title: Plotting Intensities of Infection over Time or Space
### Aliases: intensityplot.twinstim intensity.twinstim
###   intensityplot.simEpidataCS
### Keywords: hplot aplot dplot methods

### ** Examples

data("imdepi", "imdepifit")

# for the intensityplot we need the model environment, which can be
# easily added by the intelligent update method (no need to refit the model)
imdepifit <- update(imdepifit, model=TRUE)

## path of the total intensity
opar <- par(mfrow=c(2,1))
intensityplot(imdepifit, which="total intensity",
              aggregate="time", tgrid=500)
plot(imdepi, "time", breaks=100)
par(opar)

## time course of the epidemic proportion by event
intensityplot(imdepifit, which="epidemic proportion",
              aggregate="time", tgrid=500, types=1)
intensityplot(imdepifit, which="epidemic proportion",
              aggregate="time", tgrid=500, types=2, add=TRUE, col=2)
legend("topright", legend=levels(imdepi$events$type), lty=1, col=1:2,
       title = "event type")

## endemic and total intensity in one plot
intensity_endprop <- intensityplot(imdepifit, which="endemic proportion",
                                   aggregate="time", plot=FALSE)
intensity_total <- intensityplot(imdepifit, which="total intensity",
                                 aggregate="time", tgrid=501, lwd=2)
curve(intensity_endprop(x) * intensity_total(x), add=TRUE, col=2, lwd=2, n=501)
text(2500, 0.36, labels="total", col=1, pos=2, font=2)
text(2500, 0.08, labels="endemic", col=2, pos=2, font=2)


## spatial shape of the intensity (aggregated over time)
if (surveillance.options("allExamples") && requireNamespace("maptools"))
{
  ## load borders of Germany's districts
  load(system.file("shapes", "districtsD.RData", package="surveillance"))

  # total intensity (using a rather sparse 'sgrid' for speed)
  intensityplot(imdepifit, which="total intensity",
                aggregate="space", tiles=districtsD, sgrid=500)

  # epidemic proportion by type
  maps_epiprop <- lapply(1:2, function (type) {
      intensityplot(imdepifit, which="epidemic", aggregate="space",
                    types=type, tiles=districtsD, sgrid=1000,
                    at=seq(0,1,by=0.1), col.regions=rev(heat.colors(20)))
  })
  plot(maps_epiprop[[1]], split=c(1,1,2,1), more=TRUE)
  plot(maps_epiprop[[2]], split=c(2,1,2,1))
}



