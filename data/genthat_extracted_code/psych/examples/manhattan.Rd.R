library(psych)


### Name: manhattan
### Title: "Manhattan" plots of correlations with a set of criteria.
### Aliases: manhattan
### Keywords: multivariate hplot

### ** Examples

op <- par(mfrow=(c(2,3))) #we want to compare two different sets of plots
manhattan(bfi[1:25],bfi[26:28],labels=colnames(bfi)[1:25])
manhattan(bfi[1:25],bfi[26:28],log.p=TRUE)

#Do it again, but now show items by the keys.list
bfi.keys <-
  list(agree=c("-A1","A2","A3","A4","A5"),conscientious=c("C1","C2","C3","-C4","-C5"),
 extraversion=c("-E1","-E2","E3","E4","E5"),neuroticism=c("N1","N2","N3","N4","N5"),
 openness = c("O1","-O2","O3","O4","-O5"))
 manhattan(bfi[1:25],bfi[26:28],keys=bfi.keys)
manhattan(bfi[1:25],bfi[26:28],keys=bfi.keys,log.p=TRUE) 
par <- op






