library(metRology)


### Name: plot.mandel.kh
### Title: Classical plots of Mandel's statistics.
### Aliases: plot.mandel.kh
### Keywords: hplot

### ** Examples


   data(RMstudy)

   h <- with(RMstudy, mandel.h(RMstudy[2:9], g=Lab))
   plot(h, las=2) # Lab 4 shows consistent low bias; 
                  # Lab 23 several extreme values.

   #Use colours to identify particular measurands:
   plot(h, las=2, col=1:8)
   legend("bottomleft", legend=names(h), col=1:8, lty=1, cex=0.7, bg="white")
   
   #Example of Mandel's k:
   k <- with(RMstudy, mandel.k(RMstudy[2:9], g=Lab))
   plot(k, las=2) # Lab 8 looks unusually variable; 
                  # Lab 14 unusually precise




