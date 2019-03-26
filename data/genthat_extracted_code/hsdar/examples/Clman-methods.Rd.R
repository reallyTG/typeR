library(hsdar)


### Name: clman
### Title: Methods to create, manipulate and query objects of class
###   'Clman'.
### Aliases: initialize,Clman-method spectra,Clman-method
###   spectra<-,Clman,data.frame-method spectra<-,Clman,matrix-method
###   spectra<-,Clman,numeric-method plot,Clman-method
###   plot,Clman,ANY-method
### Keywords: aplot

### ** Examples

## Model spectra using PROSAIL
parameter <- data.frame(N = rep.int(c(1, 1.5),2), LAI = c(1,1,3,3))
spec <- PROSAIL(parameterList=parameter)

## Transform spectra
spec_clman <- transformSpeclib(spec, method = "sh", out = "raw")

## Return first spectrum
spectra(spec_clman)[1,]

## Plot clman
plot(spec_clman, ispec = 1, subset = c(400, 1000))



