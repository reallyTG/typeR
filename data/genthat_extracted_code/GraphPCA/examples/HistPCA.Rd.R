library(GraphPCA)


### Name: HistPCA
### Title: HistPCA
### Aliases: HistPCA

### ** Examples

data(movies)
ab = movies
ab = na.omit(ab)
Action = subset(ab,Action==1)
Action$genre = as.factor("Action")
Drama = subset(ab,Drama==1)
Drama$genre = as.factor("Drama")

Animation = subset(ab,Animation==1)
Animation$genre = as.factor("Animation")

Comedy = subset(ab,Comedy==1)
Comedy$genre = as.factor("Comedy")

Documentary = subset(ab,Documentary ==1)
Documentary $genre = as.factor("Documentary")


Romance = subset(ab,Romance==1)
Romance$genre = as.factor("Romance")

Short = subset(ab,Short==1)
Short$genre = as.factor("Short")

 ab = rbind(Action,Drama,Animation,Comedy,Documentary,Romance,Short)
 Hist1=PrepHistogram(X=sapply(ab[,3],unlist),Z=ab[,25],k=5)$Vhistogram
Hist2=PrepHistogram(X=sapply(ab[,4],unlist),Z=ab[,25],k=5)$Vhistogram
 Hist3=PrepHistogram(X=sapply(ab[,5],unlist),Z=ab[,25],k=5)$Vhistogram
Hist4=PrepHistogram(X=sapply(ab[,6],unlist),Z=ab[,25],k=5)$Vhistogram
 Hist5=PrepHistogram(X=sapply(ab[,7],unlist),Z=ab[,25],k=5)$Vhistogram
 
 ss1=Ridi(Hist1)$Ridit
 ss2=Ridi(Hist2)$Ridit
 ss3=Ridi(Hist3)$Ridit
 ss4=Ridi(Hist4)$Ridit
 ss5=Ridi(Hist5)$Ridit

 
HistPCA(list(Hist1,Hist2,Hist3,Hist4,Hist5),score=list(ss1,ss2,ss3,ss4,ss5))

res_pca=HistPCA(list(Hist1,Hist2,Hist3,Hist4,Hist5),score=list(ss1,ss2,ss3,ss4,ss5))
 
 Visu(res_pca$PCinterval)



