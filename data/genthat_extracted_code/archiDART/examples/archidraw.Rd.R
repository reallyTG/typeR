library(archiDART)


### Name: archidraw
### Title: Plotting Vectorized Root Systems
### Aliases: archidraw

### ** Examples

## Locate folder with DART and RSML files
path <- system.file("extdata", package="archiDART")

##-----------------
## DART files only
##-----------------

## Plot RSA at several observation dates
## One color for each observation date
archidraw(inputlie=path, res=75, unitlength="cm", numdate=c(15,31), finalscale=TRUE,
coldate=rainbow(31), lwd=2,las=1, bty="l", asp=1, xaxp=c(0,30,3), yaxp=c(0,90,9))

##-----------------
## RSML files only
##-----------------

## Plot RSA at the last observation date
## One color for each observation date
##2D plot
archidraw(inputrsml=path, unitlength="cm", rsml.date="age", coldate=rainbow(15), lwd=2,
twod=c("x", "y"), asp=1, las=1, bty="l")
          
##---------------------
## DART and RSML files
##---------------------

archidraw(inputlie=path, inputrsml=path, res=75, unitlength="cm", rsml.date="age",
coldate="black", lwd=2, las=1, bty="l", asp=1)



