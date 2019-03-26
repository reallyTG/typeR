library(pals)


### Name: bivariate
### Title: Bivariate palettes
### Aliases: bivariate stevens.pinkgreen stevens.bluered stevens.pinkblue
###   stevens.greenblue stevens.purplegold brewer.orangeblue
###   brewer.pinkblue tolochko.redblue arc.bluepink census.blueyellow

### ** Examples


bivcol <- function(pal){
  tit <- substitute(pal)
  pal <- pal()
  ncol <- length(pal)
  nx <- sqrt(length(pal))
  image(matrix(1:ncol, nrow=sqrt(ncol)), axes=FALSE, col=pal)
  mtext(tit)
}
op <- par(mfrow=c(3,4), mar=c(1,1,2,1))
bivcol(stevens.pinkgreen)
bivcol(stevens.bluered)
bivcol(stevens.pinkblue)
bivcol(stevens.greenblue)
bivcol(stevens.purplegold)
bivcol(brewer.orangeblue)
bivcol(brewer.pinkblue)
bivcol(tolochko.redblue)
bivcol(arc.bluepink)
bivcol(census.blueyellow)
par(op)




