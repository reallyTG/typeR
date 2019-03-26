library(psych)


### Name: unidim
### Title: Several indices of the unidimensionality of a set of variables.
### Aliases: unidim
### Keywords: models multivariate

### ** Examples

#test the unidimensionality of the five factors of the bfi data set.

keys.list <-
  list(agree=c("-A1","A2","A3","A4","A5"),conscientious=c("C1","C2","C3","-C4","-C5"),
extraversion=c("-E1","-E2","E3","E4","E5"),neuroticism=c("N1","N2","N3","N4","N5"),
openness = c("O1","-O2","O3","O4","-O5"), all = 
c("-A1","A2","A3","A4","A5","C1","C2","C3","-C4","-C5","-E1","-E2","E3","E4","E5","N1" 
,"N2","N3","N4","N5","O1","-O2","O3","O4","-O5") )
unidim(bfi,keys.list) 

#Try a known 3 factor structure
x <- sim.minor(nfact=3,bipolar=FALSE)
unidim(x$model) 
keys.list <- list(first =c(1:4),second = 5:8,third=9:12,all=1:12)
unidim(x$model,keys.list)

x <- sim.minor(nfact=3)
unidim(x$model,keys.list,flip=TRUE)




