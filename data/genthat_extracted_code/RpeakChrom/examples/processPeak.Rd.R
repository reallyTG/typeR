library(RpeakChrom)


### Name: processPeak
### Title: Estimating the main parameters of a chromatographic peak.
### Aliases: processPeak

### ** Examples

 ## Reading the file to get the peak
 # peak <- readChrom("file.csv", do.plot = T,
 #   t1=28, t2=29.5)
 # parameters <- processPeak(peak, baseline=FALSE, flow=0.1,
 #   method="pvmg", compound="alanine", area=TRUE)

 ## If when using processPeak it gives an error "singular gradient matrix
 ## at initial parameter estimates", the peak needs to be read again to fit
 ## retention times. For example:

 # peak <- readChrom("file.csv", do.plot = T,
 #    t1=28.5, t2=31)

  parameters <- processPeak(peak, baseline = FALSE, flow = 0.1, method = "pvmg",
    compound = "alanine", area = TRUE)




