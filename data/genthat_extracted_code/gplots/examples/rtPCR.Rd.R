library(gplots)


### Name: rtPCR
### Title: Teratogenesis rtPCR data
### Aliases: rtPCR
### Keywords: datasets

### ** Examples

data(rtPCR)

# same scale
overplot( RQ ~ Conc..ug.ml. | Test.Substance,
         data=rtPCR,
         subset=Detector=="ProbeType 7" & Conc..ug.ml. > 0,
         same.scale=TRUE,
         log="xy",
         f=3/4,
         main="Detector=ProbeType 7",
         xlab="Concentration (ug/ml)",
         ylab="Relative Gene Quantification"
         )

# different scales, but force lower limit to 0.01 
overplot( RQ ~ Conc..ug.ml. | Test.Substance,
         data=rtPCR,
         subset=Detector=="ProbeType 7" & Conc..ug.ml. > 0,
         log="xy",
         f=3/4,
         main="Detector=ProbeType 7",
         xlab="Concentration (ug/ml)",
         ylab="Relative Gene Quantification",
         min.y=0.01
         )



