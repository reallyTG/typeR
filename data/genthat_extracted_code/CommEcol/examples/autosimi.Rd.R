library(CommEcol)


### Name: autosimi
### Title: Autosimilarity curve of species community data
### Aliases: autosimi

### ** Examples

x<-matrix(0,4,4)
diag(x)<-1
x4<-rbind(x,x,x,x)
x4
autosimi(x4, binary=TRUE)
plot(autosimi(x4, binary=TRUE))

data(BCI)
simi<-autosimi(BCI, binary=TRUE, permutations=5)
simi
plot(simi, ylim=c(0.5,1)) # maintain the plot window open for the next curve
simi.log<-autosimi(BCI, binary=FALSE, log.transf=TRUE, permutations=5)
points(simi.log, col="red")



