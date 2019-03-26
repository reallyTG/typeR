library(MSnbase)


### Name: ReporterIons-class
### Title: The "ReporterIons" Class
### Aliases: ReporterIons-class class:ReporterIons ReporterIons
###   show,ReporterIons-method [,ReporterIons-method
###   [,ReporterIons,ANY,ANY-method [,ReporterIons,ANY,ANY,ANY-method
###   length-method length,ReporterIons-method mz,ReporterIons-method
###   reporterColours-method reporterColours,ReporterIons-method
###   reporterColours reporterColors-method
###   reporterColors,ReporterIons-method reporterColors
###   reporterNames-method reporterNames,ReporterIons-method reporterNames
###   reporterNames<-,ReporterIons-method
###   reporterNames<-,ReporterIons,ANY-method
###   reporterNames<-,ReporterIons,character-method reporterNames<-
###   width-method width,ReporterIons-method width
###   names,ReporterIons-method description,ReporterIons-method
### Keywords: classes

### ** Examples

## Code used for the iTRAQ4 set
ri <- new("ReporterIons",
          description="4-plex iTRAQ",
          name="iTRAQ4",
          reporterNames=c("iTRAQ4.114","iTRAQ4.115",
                          "iTRAQ4.116","iTRAQ4.117"),
          mz=c(114.1,115.1,116.1,117.1),
          col=c("red","green","blue","yellow"),
          width=0.05)
ri
reporterNames(ri)
ri[1:2]



