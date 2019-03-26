library(metRology)


### Name:  MSD-class 
### Title: Methods for the object returned by 'msd'.
### Aliases: ' MSD-class ' ' print.MSD' ' plot.MSD' ' barplot.MSD'
### Keywords: univar

### ** Examples


  data(Pb)
  msd.Pb<-msd(Pb$value, Pb$u)  # Uses individual standard uncertainties
  names(msd.Pb) <- as.character(Pb$lab)
  
  plot(msd.Pb)

  barplot(msd.Pb)




