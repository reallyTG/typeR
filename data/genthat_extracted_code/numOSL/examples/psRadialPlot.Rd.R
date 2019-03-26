library(numOSL)


### Name: psRadialPlot
### Title: Pseudo radial plot drawing
### Aliases: psRadialPlot psRadialPlot.default
### Keywords: equivalent dose radial plot

### ** Examples

   data(EDdata)
   psRadialPlot(EDdata$al3, addsigma=0.10, 
                dose=c(39.14, 51.27, 79.14), digits=1,
                zmin=30, zmax=100, ntick=10, rg=1)



