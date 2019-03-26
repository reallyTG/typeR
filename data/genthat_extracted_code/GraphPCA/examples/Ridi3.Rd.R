library(GraphPCA)


### Name: Ridi3
### Title: Normalized Mantel Hansen's Scores computation using cumulative
###   distribution function
### Aliases: Ridi3

### ** Examples


Hist1=PrepHistogram(X=iris[,1],Z=iris[,5])$Vhistogram
Hist2=PrepHistogram(X=iris[,2],Z=iris[,5])$Vhistogram
Hist3=PrepHistogram(X=iris[,3],Z=iris[,5])$Vhistogram
Hist4=PrepHistogram(X=iris[,4],Z=iris[,5])$Vhistogram

sss1=Ridi3(Hist1)$Ridit
sss2=Ridi3(Hist2)$Ridit
sss3=Ridi3(Hist3)$Ridit
sss4=Ridi3(Hist4)$Ridit




