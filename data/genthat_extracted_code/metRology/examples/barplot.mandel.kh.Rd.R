library(metRology)


### Name: barplot.mandel.kh
### Title: Barplot of Mandel's h or k statistics
### Aliases: barplot.mandel.kh
### Keywords: hplot

### ** Examples

   data(RMstudy)

   h <- with(RMstudy, mandel.h(RMstudy[2:9], g=Lab))
   barplot(h, las=2) # Lab 4 shows consistent low bias; 
                  # Lab 23 several extreme values.

   #Use colours to identify particular measurands:
   barplot(h, las=2, col=1:8)
   legend("bottomleft", legend=names(h), fill=1:8, cex=0.7, bg="white")
   
   #Example of Mandel's k:
   k <- with(RMstudy, mandel.k(RMstudy[2:9], g=Lab))
   barplot(k, las=2) # Lab 8 looks unusually variable; 
                  # Lab 14 unusually precise



