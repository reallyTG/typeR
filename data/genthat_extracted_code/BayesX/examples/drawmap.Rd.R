library(BayesX)


### Name: drawmap
### Title: Drawing Geographical Information
### Aliases: drawmap
### Keywords: hplot

### ** Examples

germany <- read.bnd(system.file("examples/germany.bnd", package="BayesX"))
drawmap(map=germany)
drawmap(map=germany, drawnames=TRUE)

res <- read.table(system.file("examples/spatial_f_regions_spatial.res", 
                              package="BayesX"), header=TRUE)

drawmap(res, map=germany)
drawmap(res, map=germany, limits=c(-2,4))
drawmap(res, map=germany, regionvar="regions", plotvar="pmed")
drawmap(res, map=germany, legend=FALSE)
drawmap(res, map=germany, legend=FALSE, main="spatial effect")

drawmap(res, map=germany, cols="hsv")
drawmap(res, map=germany, swapcolors=TRUE, cols="hsv")
drawmap(res, map=germany, cols="grey")
drawmap(res, map=germany,
        cols=c('darkgreen','green','yellow','orange','red','darkred'))

drawmap(res, map=germany, pcat=TRUE, cols="hcl")
drawmap(res, map=germany, pcat=TRUE, cols="hsv")
drawmap(res, map=germany, pcat=TRUE, cols="grey")

drawmap(res, map=germany, nrcolors=10, cols="hcl")
drawmap(res, map=germany, nrcolors=10, cols="hsv")
drawmap(res, map=germany, nrcolors=10, cols="grey")

drawmap(res, map=germany, cols="hcl",
        hcl.par=list(h=c(0,120), c=60, l=c(45,90), power=1.2))
drawmap(res, map=germany, cols="hcl",
        hcl.par=list(h=c(300,120), c=60, l=c(45,90), power=1.2))
drawmap(res, map=germany, cols="hcl",
        hcl.par=list(h=c(40,260), c=60, l=c(45,90), power=1.2))
drawmap(res, map=germany, cols="hsv", hsv.par=list(s=0.7, v=0.7))



