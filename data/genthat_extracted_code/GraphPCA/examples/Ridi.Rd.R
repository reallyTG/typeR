library(GraphPCA)


### Name: Ridi
### Title: Mantel Hansen's Scores computation using cumulative distribution
###   function
### Aliases: Ridi

### ** Examples



Hist1=PrepHistogram(X=iris[,1],Z=iris[,5])$Vhistogram
Hist2=PrepHistogram(X=iris[,2],Z=iris[,5])$Vhistogram
Hist3=PrepHistogram(X=iris[,3],Z=iris[,5])$Vhistogram
Hist4=PrepHistogram(X=iris[,4],Z=iris[,5])$Vhistogram

s1=Ridi(Hist1)$Ridit
s2=Ridi(Hist2)$Ridit
s3=Ridi(Hist3)$Ridit
s4=Ridi(Hist4)$Ridit




