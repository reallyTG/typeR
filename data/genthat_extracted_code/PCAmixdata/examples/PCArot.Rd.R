library(PCAmixdata)


### Name: PCArot
### Title: Varimax rotation in PCAmix
### Aliases: PCArot
### Keywords: multivariate

### ** Examples


#PCAMIX:
data(wine)
pca<-PCAmix(X.quanti=wine[,c(3:29)],X.quali=wine[,1:2],ndim=4,graph=FALSE)
pca

rot<-PCArot(pca,3)
rot
rot$eig #percentages of variances after rotation

plot(rot,choice="ind",coloring.ind=wine[,1],
	    posleg="bottomleft", main="Rotated scores")
plot(rot,choice="sqload",main="Squared loadings after rotation")
plot(rot,choice="levels",main="Levels after rotation")
plot(rot,choice="cor",main="Correlation circle after rotation")



#PCA:
data(decathlon)
quali<-decathlon[,13]
pca<-PCAmix(decathlon[,1:10], graph=FALSE)

rot<-PCArot(pca,3)
plot(rot,choice="ind",coloring.ind=quali,cex=0.8,
	    posleg="topright",main="Scores after rotation")
plot(rot, choice="sqload", main="Squared correlations after rotation")
plot(rot, choice="cor", main="Correlation circle after rotation")

#MCA
data(flower)
mca <- PCAmix(X.quali=flower[,1:4],rename.level=TRUE,graph=FALSE)

rot<-PCArot(mca,2)
plot(rot,choice="ind",main="Scores after rotation")
plot(rot, choice="sqload", main="Correlation ratios after rotation")
plot(rot, choice="levels", main="Levels after rotation")





