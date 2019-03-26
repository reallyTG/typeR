library(measuRing)


### Name: colNarrow
### Title: Narrow rings
### Aliases: colNarrow

### ** Examples

## (not run) Read one image section in package measuRing:
image1 <- system.file("P105_a.png", package="measuRing")    
## (not run) compute a gray matrix from RGB in the image:
gray <- imageTogray(image = image1,ppi=1000)
## (not run) Columns in gray matrix to be included/excluded:
Toinc <- c(196,202,387,1564) 
Toexc <- c(21,130,197,207,1444,1484)
## (not run) tree-ring widths:
rwidths <- ringWidths(gray,inclu = Toinc,exclu = Toexc,last.yr=2012)
##(not run) narrow rings:
narrows <- colNarrow(rwidths,marker = 8)



