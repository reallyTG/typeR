library(GraphPCA)


### Name: Ridi2
### Title: Standardized Mantel Hansen's Scores computation using cumulative
###   distribution function
### Aliases: Ridi2

### ** Examples



Hist1=PrepHistogram(X=iris[,1],Z=iris[,5])$Vhistogram
Hist2=PrepHistogram(X=iris[,2],Z=iris[,5])$Vhistogram
Hist3=PrepHistogram(X=iris[,3],Z=iris[,5])$Vhistogram
Hist4=PrepHistogram(X=iris[,4],Z=iris[,5])$Vhistogram

ss1=Ridi2(Hist1)$Ridit
ss2=Ridi2(Hist2)$Ridit
ss3=Ridi2(Hist3)$Ridit
ss4=Ridi2(Hist4)$Ridit




