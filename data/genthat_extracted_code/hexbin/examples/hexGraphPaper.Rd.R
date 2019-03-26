library(hexbin)


### Name: hexGraphPaper
### Title: Create a Hexgon Grid
### Aliases: hexGraphPaper hgridcent
### Keywords: aplot dplot

### ** Examples

 x <- rnorm(10000)
 y <- rnorm(10000,x,x)
 hbin <- hexbin(x,y)
 hvp <- plot(hbin,type="n")
 pushHexport(hvp$plot,clip="on")
 hexGraphPaper(hbin,border=grey(.8))
 grid.hexagons(hbin)



