library(seqinr)


### Name: dinucl
### Title: Mean zscore on 242 complete bacterial chromosomes
### Aliases: dinucl
### Keywords: datasets

### ** Examples

data(dinucl)
par(mfrow = c(2, 2), mar = c(4,4,0.5,0.5)+0.1)
myplot <- function(x){
  plot(dinucl$intergenic[, x], dinucl$coding[, x],
  xlab = "intergenic", ylab = "coding", 
  las = 1, ylim = c(-6, 4), 
  xlim = c(-3, 3), cex = 0)
  rect(-10,-10,-1.96,10,col="yellow", border = "yellow")
  rect(1.96,-10,10,10,col="yellow", border = "yellow")
  rect(-10,-10,10,-1.96,col="yellow", border = "yellow")
  rect(-10,1.96,10,10,col="yellow", border = "yellow")
  abline(v=0,lty=3)
  abline(h=0,lty=3)
  abline(h=-1.96,lty=2)
  abline(h=+1.96,lty=2)
  abline(v=-1.96,lty=2)
  abline(v=+1.96,lty=2)
  points(dinucl$intergenic[, x], dinucl$coding[, x], pch = 21,
  col = rgb(.1,.1,.1,.5), bg = rgb(.5,.5,.5,.5))
  legend("bottomright", inset = 0.02,
   legend = paste(substr(x,1,1), "p",
    substr(x,2,2), " bias", sep = ""), cex = 1.25, bg = "white")
  box()
}
myplot("CT")
myplot("TC")
myplot("CC")
myplot("TT")



