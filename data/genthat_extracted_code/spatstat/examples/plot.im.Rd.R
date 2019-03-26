library(spatstat)


### Name: plot.im
### Title: Plot a Pixel Image
### Aliases: plot.im image.im
### Keywords: spatial hplot

### ** Examples

   # an image
   Z <- setcov(owin())
   plot(Z)
   plot(Z, ribside="bottom")
   # stretchable colour map
   plot(Z, col=terrain.colors(128), axes=FALSE)
   # fixed colour map
   tc <- colourmap(rainbow(128), breaks=seq(-1,2,length=129))
   plot(Z, col=tc)
   # colour map function, with argument 'range'
   plot(Z, col=beachcolours, colargs=list(sealevel=0.5))
   # tweaking the plot
   plot(Z, main="La vie en bleu", col.main="blue", cex.main=1.5,
        box=FALSE,
        ribargs=list(col.axis="blue", col.ticks="blue", cex.axis=0.75))
   # log scale
   V <- eval.im(exp(exp(Z+2))/1e4)
   plot(V, log=TRUE, main="Log scale")
   # it's complex
   Y <- exp(Z + V * 1i)
   plot(Y)



