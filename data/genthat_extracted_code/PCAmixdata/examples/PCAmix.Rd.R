library(PCAmixdata)


### Name: PCAmix
### Title: Principal component analysis of mixed data
### Aliases: PCAmix

### ** Examples

#PCAMIX:
data(wine)
str(wine)
X.quanti <- splitmix(wine)$X.quanti
X.quali <- splitmix(wine)$X.quali
pca<-PCAmix(X.quanti[,1:27],X.quali,ndim=4)
pca<-PCAmix(X.quanti[,1:27],X.quali,ndim=4,graph=FALSE)
pca$eig
pca$ind$coord

#PCA:
data(decathlon)
quali<-decathlon[,13]
pca<-PCAmix(decathlon[,1:10])
pca<-PCAmix(decathlon[,1:10], graph=FALSE)
plot(pca,choice="ind",coloring.ind=quali,cex=0.8,
     posleg="topright",main="Scores")
plot(pca, choice="sqload",main="Squared correlations")
plot(pca, choice="cor",main="Correlation circle")
pca$quanti$coord

#MCA
data(flower)
mca <- PCAmix(X.quali=flower[,1:4],rename.level=TRUE)
mca <- PCAmix(X.quali=flower[,1:4],rename.level=TRUE,graph=FALSE)
plot(mca,choice="ind",main="Scores")
plot(mca,choice="sqload",main="Correlation ratios")
plot(mca,choice="levels",main="Levels")
mca$levels$coord

#Missing values
data(vnf)
PCAmix(X.quali=vnf,rename.level=TRUE)
vnf2<-na.omit(vnf)
PCAmix(X.quali=vnf2,rename.level=TRUE)



