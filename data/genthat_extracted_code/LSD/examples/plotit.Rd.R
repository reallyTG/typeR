library(LSD)


### Name: plotit
### Title: Plotting wrapper function to plot plots in printable quality and
###   all kinds of formats
### Aliases: LSD.plotit plotit
### Keywords: bmp, jpeg, pdf plot, png, ps, tiff,

### ** Examples

data(homer)

plotsfkt = function(){
		colpal = c("white","black","yellow","wheat3")
		align(homer,colpal = colpal,main = "D'OH!",asp = 1,axes = FALSE)
}

plotit("homer",sw = 2,sh = 2,sres = 2,plotsfkt,saveit = TRUE,fileformat = "jpeg")

plotit("homer",sw = 2,sh = 2,sres = 2,plotsfkt,saveit = TRUE,fileformat = "png")

plotit("homer",sw = 2,sh = 2,sres = 2,plotsfkt,saveit = TRUE,fileformat = "bmp")

plotit("homer",sw = 2,sh = 2,sres = 2,plotsfkt,saveit = TRUE,fileformat = "tiff")

plotit("homer",sw = 2,sh = 2,sres = 2,plotsfkt,saveit = TRUE,fileformat = "ps")

plotit("homer",sw = 2,sh = 2,sres = 2,plotsfkt,saveit = TRUE,fileformat = "pdf")



