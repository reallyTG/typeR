library(metRology)


### Name:  kplot 
### Title: Dot-and-bar plot for Key Comparisons
### Aliases: ' kplot ' ' kplot.default ' ' kplot.ilab ' ' kpoints '
### Keywords: hplot

### ** Examples


  data(Pb)
  kplot(Pb$value, Pb$U, assigned=2.99, U.assigned=0.06)
  kplot(Pb$value, Pb$U, assigned=2.99, U.assigned=0.06, do.pdf=TRUE)
	
  #Use of return value for annotation
  kp<-kplot(Pb$value, Pb$U, assigned=2.99, U.assigned=0.06)
  text(kp$at, Pb$value-Pb$U, Pb$lab, srt=90, pos=4, cex=0.7)




