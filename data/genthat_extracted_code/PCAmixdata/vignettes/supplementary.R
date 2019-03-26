## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,eval=TRUE,fig.align="center",fig.width = 7,fig.height = 6)

## ------------------------------------------------------------------------
library(PCAmixdata)

## ------------------------------------------------------------------------
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

## ------------------------------------------------------------------------
data(wine)
X.quanti <- splitmix(wine)$X.quanti[,1:5]
X.quali <- splitmix(wine)$X.quali[,1,drop=FALSE]
X.quanti.sup <- splitmix(wine)$X.quanti[,28:29]
X.quali.sup <- splitmix(wine)$X.quali[,2,drop=FALSE]
data <- cbind(X.quanti,X.quali)
data.sup <- cbind(X.quanti.sup,X.quali.sup)

groups <-c(1,2,2,3,3,1)
name.groups <- c("G1","G2","G3")
mfa <- MFAmix(data,groups,name.groups,ndim=4,rename.level=TRUE,graph=FALSE)


groups.sup <- c(1,1,2)
name.groups.sup <- c("Gsup1","Gsup2")
mfa.sup <- supvar(mfa,data.sup,groups.sup,name.groups.sup,rename.level=TRUE)
plot(mfa.sup,choice="sqload",coloring.var="groups")
plot(mfa.sup,choice="axes",coloring.var="groups")
plot(mfa.sup,choice="groups",coloring.var="groups")
plot(mfa.sup,choice="levels",coloring.var="groups")
plot(mfa.sup,choice="levels")
plot(mfa.sup,choice="cor",coloring.var = "groups")

## ------------------------------------------------------------------------
#devtools::install_github("chavent/PCAmixdata")
library(PCAmixdata)
data(wine)
X.quanti <- splitmix(wine)$X.quanti[,1:5]
X.quali <- splitmix(wine)$X.quali[,1,drop=FALSE]
X.quali.sup <- splitmix(wine)$X.quali[,2,drop=FALSE]
data <- cbind(X.quanti,X.quali)

groups <-c(1,1,1,2,2,2)
name.groups <- c("G1","G2")
mfa <- MFAmix(data,groups,name.groups,ndim=4,rename.level=TRUE,graph=FALSE)

groups.sup <- c(1)
name.groups.sup <- "Gsup1"
mfa.sup <- supvar(mfa,X.quali.sup,groups.sup,name.groups.sup,rename.level=TRUE)
plot(mfa.sup,choice="levels",coloring.var = "groups")

groups.sup <- c(1,1,2)
name.groups.sup <- c("Gsup1","Gsup2")
mfa.sup <- supvar(mfa,data.sup,groups.sup,name.groups.sup,rename.level=TRUE)
plot(mfa.sup,choice="sqload",coloring.var="groups")
plot(mfa.sup,choice="axes",coloring.var="groups")
plot(mfa.sup,choice="groups",coloring.var="groups")
plot(mfa.sup,choice="levels",coloring.var="groups")
plot(mfa.sup,choice="levels")
plot(mfa.sup,choice="cor",coloring.var = "groups")

## ------------------------------------------------------------------------
data(wine)
X.quanti <- splitmix(wine)$X.quanti[,1:5]
X.quali <- splitmix(wine)$X.quali
n <- nrow(wine)
sub <- sample(1:n,10)
pca<-PCAmix(X.quanti[sub,],X.quali[sub,],ndim=4,graph=FALSE)
pred <- predict(pca,X.quanti[-sub,],X.quali[-sub,])
plot(pca,axes=c(1,2))
points(pred[,c(1,2)],col=2,pch=16)
text(pred[,c(1,2)], labels = rownames(X.quanti[-sub,1:5]), col=2,pos=3)

## ------------------------------------------------------------------------
data(gironde)
groups <- c(rep(1,9),rep(2,5),rep(3,9),rep(4,4))
name.groups <- c("employment","housing","services","environment")
dat<-cbind(gironde$employment,gironde$housing,
                gironde$services,gironde$environment)
n <- nrow(dat)
set.seed(10)
sub <- sample(1:n,520)
res<-MFAmix(data=dat[sub,],groups=groups,name.groups=name.groups, rename.level=TRUE, ndim=3,graph=FALSE)
pred<-predict(res,data=dat[-sub,],groups=class.var,name.groups=names)
plot(res,choice="ind",cex=0.6,lim.cos2.plot=0.7)  
points(pred[1:5,c(1,2)],col=2,pch=16,cex=0.6)
text(pred[1:5,c(1,2)], labels = rownames(dat[-sub,])[1:5],
     col=2,pos=3,cex=0.6)


