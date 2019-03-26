library(ClustVarLV)


### Name: authen_NMR
### Title: Authentication data set/ NMR spectra
### Aliases: authen_NMR
### Keywords: datasets

### ** Examples

  data(authen_NMR)
  xlab=as.numeric(colnames(authen_NMR$Xz2))
  plot(xlab, authen_NMR$Xz2[1,], type="l", xlab="ppm",ylab="", ylim=c(14.8,15.8), 
                                           xlim=rev(range(xlab)))
  for (i in (1:nrow(authen_NMR$Xz2))) lines(xlab,authen_NMR$Xz2[i,])



