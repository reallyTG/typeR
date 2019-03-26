library(Luminescence)


### Name: plot_RLum.Data.Spectrum
### Title: Plot function for an RLum.Data.Spectrum S4 class object
### Aliases: plot_RLum.Data.Spectrum
### Keywords: aplot

### ** Examples


##load example data
data(ExampleData.XSYG, envir = environment())

##(1)plot simple spectrum (2D) - contour
plot_RLum.Data.Spectrum(TL.Spectrum,
                        plot.type="contour",
                        xlim = c(310,750),
                        ylim = c(0,300),
                        bin.rows=10,
                        bin.cols = 1)

##(2) plot spectrum (3D)
plot_RLum.Data.Spectrum(TL.Spectrum,
                        plot.type="persp",
                        xlim = c(310,750),
                        ylim = c(0,100),
                        bin.rows=10,
                        bin.cols = 1)

##(3) plot multiple lines (2D) - multiple.lines (with ylim)
plot_RLum.Data.Spectrum(TL.Spectrum,
                        plot.type="multiple.lines",
                        xlim = c(310,750),
                        ylim = c(0,100),
                        bin.rows=10,
                        bin.cols = 1)

## Not run: 
##D  ##(4) interactive plot using the package plotly ("surface")
##D  plot_RLum.Data.Spectrum(TL.Spectrum, plot.type="interactive",
##D  xlim = c(310,750), ylim = c(0,300), bin.rows=10,
##D  bin.cols = 1)
##D 
##D  ##(5) interactive plot using the package plotly ("contour")
##D  plot_RLum.Data.Spectrum(TL.Spectrum, plot.type="interactive",
##D  xlim = c(310,750), ylim = c(0,300), bin.rows=10,
##D  bin.cols = 1,
##D  type = "contour",
##D  showscale = TRUE)
##D 
##D  ##(6) interactive plot using the package plotly ("heatmap")
##D  plot_RLum.Data.Spectrum(TL.Spectrum, plot.type="interactive",
##D  xlim = c(310,750), ylim = c(0,300), bin.rows=10,
##D  bin.cols = 1,
##D  type = "heatmap",
##D  showscale = TRUE)
##D 
##D  ##(7) alternative using the package fields
##D  fields::image.plot(get_RLum(TL.Spectrum))
##D  contour(get_RLum(TL.Spectrum), add = TRUE)
##D 
## End(Not run)




