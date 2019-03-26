library(PCAmixdata)


### Name: plot.PCAmix
### Title: Graphical outputs of PCAmix and PCArot
### Aliases: plot.PCAmix

### ** Examples

data(gironde)
base <- gironde$housing[1:20,]
X.quanti <-splitmix(base)$X.quanti
X.quali <- splitmix(base)$X.quali
res<-PCAmix(X.quanti, X.quali, rename.level=TRUE, ndim=3,graph=FALSE)

#----quantitative variables on the correlation circle
plot(res,choice="cor",cex=0.8)

#----individuals component map
plot(res,choice="ind",cex=0.8)

#----individuals colored with the qualitative variable "houses"
houses <- X.quali$houses
plot(res,choice="ind",cex=0.6,coloring.ind=houses) 

#----individuals selected according to their cos2
plot(res,choice="ind",cex=0.6,lim.cos2.plot=0.8)
#----all the variables plotted with the squared loadings
plot(res,choice="sqload",cex=0.8)

#----variables colored according to their type (quanti or quali)
plot(res,choice="sqload",cex=0.8,coloring.var=TRUE) 

#----levels component map
plot(res,choice="levels",cex=0.8)

#----example with supplementary variables
data(wine)
X.quanti <- splitmix(wine)$X.quanti[,1:5]
X.quali <- splitmix(wine)$X.quali[,1,drop=FALSE]
X.quanti.sup <-splitmix(wine)$X.quanti[,28:29]
X.quali.sup <-splitmix(wine)$X.quali[,2,drop=FALSE]
pca<-PCAmix(X.quanti,X.quali,ndim=4,graph=FALSE)
pca2 <- supvar(pca,X.quanti.sup,X.quali.sup)
plot(pca2,choice="levels")
plot(pca2,choice="cor")
plot(pca2,choice="sqload")




