library(HistDAWass)


### Name: plot-distributionH
### Title: plot for a distributionH object
### Aliases: plot-distributionH plot,distributionH-method

### ** Examples

##---- initialize a distributionH
 mydist<-distributionH(x=c(7,8,10,15),p=c(0, 0.2, 0.7, 1))
 # show the histogram
 plot(mydist) #plots mydist
 plot(mydist, type="HISTO", col="red", border="blue") #plots mydist
 plot(mydist, type="DENS", col="red", border="blue") #plots a density approximation for mydist
 plot(mydist, type="HBOXPLOT") #plots a horizontal boxplot for mydist
 plot(mydist, type="VBOXPLOT") #plots a vertical boxplot for mydist
 plot(mydist, type="CDF") #plots the cumulative distribution function of mydist
 plot(mydist, type="QF") #plots the quantile function of mydist



