library(gplots)


### Name: overplot
### Title: Plot multiple variables on the same region, with appropriate
###   axes
### Aliases: overplot panel.overplot
### Keywords: hplot

### ** Examples


# Example teratogenicity rtPCR data
data(rtPCR)

# same scale
overplot( RQ ~ Conc..ug.ml. | Test.Substance,
         data=rtPCR,
         subset=Detector=="ProbeType 1" & Conc..ug.ml. > 0,
         same.scale=TRUE,
         log="xy",
         f=3/4,
         main="Detector=ProbeType 1",
         xlab="Concentration (ug/ml)",
         ylab="Relative Gene Quantification"
         )

# different scales, but force lower limit to 0.01 
overplot( RQ ~ Conc..ug.ml. | Test.Substance,
         data=rtPCR,
         subset=Detector=="ProbeType 8" & Conc..ug.ml. > 0,
         log="xy",
         f=3/4,
         main="Detector=ProbeType 8",
         xlab="Concentration (ug/ml)",
         ylab="Relative Gene Quantification",
         min.y=0.01
         )




