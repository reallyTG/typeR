## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,eval=TRUE,fig.align="center",fig.width = 7,fig.height = 7)

## ------------------------------------------------------------------------
library(PCAmixdata)
data(gironde)
head(gironde$housing)

## ------------------------------------------------------------------------
split <- splitmix(gironde$housing)
X1 <- split$X.quanti 
X2 <- split$X.quali 
res.pcamix <- PCAmix(X.quanti=X1, X.quali=X2,rename.level=TRUE,
                     graph=FALSE)

## ------------------------------------------------------------------------
res.pcamix

## ------------------------------------------------------------------------
res.pcamix$eig

## ----out.width='70%'-----------------------------------------------------
?plot.PCAmix
par(mfrow=c(2,2))
plot(res.pcamix,choice="ind",coloring.ind=X2$houses,label=FALSE,
      posleg="bottomright", main="Observations")
plot(res.pcamix,choice="levels",xlim=c(-1.5,2.5), main="Levels")
plot(res.pcamix,choice="cor",main="Numerical variables")
plot(res.pcamix,choice="sqload",coloring.var=T, leg=TRUE,
     posleg="topright", main="All variables")

## ----out.width='50%'-----------------------------------------------------
sort(res.pcamix$ind$coord[,2])[1:10]
plot(res.pcamix,choice="ind",lim.contrib.plot = 2,
      posleg="bottomright", main="Observations",cex=0.8)

## ------------------------------------------------------------------------
set.seed(10)
test <- sample(1:nrow(gironde$housing),100)
train.pcamix <- PCAmix(X1[-test,],X2[-test,],ndim=2,graph=FALSE)

## ------------------------------------------------------------------------
?predict.PCAmix
pred <- predict(train.pcamix,X1[test,],X2[test,])
head(pred)

## ----out.width='50%'-----------------------------------------------------
plot(train.pcamix,axes=c(1,2),label=FALSE,main="Observations map")
points(pred,col=2,pch=16)
legend("bottomright",legend = c("train","test"),fill=1:2,col=1:2)

## ------------------------------------------------------------------------
?supvar.PCAmix
X1sup <- gironde$environment[,1,drop=FALSE]
X2sup <- gironde$services[,7,drop=FALSE]
res.sup <- supvar(res.pcamix,X1sup,X2sup,rename.level=TRUE)
res.sup$quanti.sup$coord[,1:2,drop=FALSE]
res.sup$levels.sup$coord[,1:2]

## ----out.width='50%'-----------------------------------------------------
?plot.PCAmix
#par(mfrow=c(2,1))
plot(res.sup,choice="cor",main="Numerical variables")
plot(res.sup,choice="levels",main="Levels",xlim=c(-2,2.5))

## ------------------------------------------------------------------------
library(PCAmixdata)
data(gironde)
#Create the datatable housing without the ten first observations
train <- gironde$housing[-c(1:10), ]
#Split the datatable
split <- splitmix(train)
X1 <- split$X.quanti 
X2 <- split$X.quali 
res.pcamix <- PCAmix(X.quanti=X1, X.quali=X2,rename.level=TRUE,
                     graph=FALSE)

## ------------------------------------------------------------------------
res.pcamix$eig 

## ------------------------------------------------------------------------
res.pcarot <- PCArot(res.pcamix,dim=3,graph=FALSE)
res.pcarot$eig #variance of the rotated PCs
sum(res.pcarot$eig[,2]) #unchanged explained inertia

## ------------------------------------------------------------------------
res.pcarot

## ------------------------------------------------------------------------
round(res.pcamix$sqload[,1:3],digit=2)
round(res.pcarot$sqload,digit=2)

## ----out.width='70%'-----------------------------------------------------
par(mfrow=c(2,2))
plot(res.pcamix,choice="ind",label=FALSE,axes=c(1,3),
     main="Observations before rotation")
plot(res.pcarot,choice="ind",label=FALSE,axes=c(1,3),
     main="Observations after rotation")
plot(res.pcamix,choice="sqload", coloring.var=TRUE, leg=TRUE,axes=c(1,3),
     posleg="topleft", main="Variables before rotation",
     xlim=c(0,1), ylim=c(0,1))
plot(res.pcarot,choice="sqload", coloring.var=TRUE, leg=TRUE,axes=c(1,3),
     posleg="topright", main="Variables after rotation",
     xlim=c(0,1), ylim=c(0,1))

## ----out.width='70%'-----------------------------------------------------
par(mfrow=c(2,2))
plot(res.pcamix,choice="cor", coloring.var=TRUE, leg=TRUE,axes=c(1,3),
     posleg="topright", main="Before rotation")
plot(res.pcarot,choice="cor", coloring.var=TRUE, leg=TRUE,axes=c(1,3),
     posleg="topright", main="After rotation")
plot(res.pcamix,choice="levels",  leg=TRUE,axes=c(1,3),
     posleg="topright", main="Before rotation",xlim=c(-1.5,2.5))
plot(res.pcarot,choice="levels", leg=TRUE,axes=c(1,3),
     posleg="topright", main="After rotation",xlim=c(-1.5,2.5))

## ------------------------------------------------------------------------
test <- gironde$housing[1:10, ]
splitnew <- splitmix(test)
X1new <- splitnew$X.quanti
X2new <- splitnew$X.quali
pred.rot <- predict(res.pcarot, X.quanti=X1new, X.quali=X2new)
pred.rot

## ----out.width='50%'-----------------------------------------------------
plot(res.pcarot,axes=c(1,3),label=FALSE,main="Observations map after rotation")
points(pred.rot[,c(1,3)],col=2,pch=16)
legend("topright",legend = c("train","test"),fill=1:2,col=1:2)

## ------------------------------------------------------------------------
library(PCAmixdata)
data(gironde)
names(gironde)

## ------------------------------------------------------------------------
#Concatenation of the 4 datatables
dat <- cbind(gironde$employment,gironde$housing,gironde$services,gironde$environment) 
index <- c(rep(1,9),rep(2,5),rep(3,9),rep(4,4)) 
names <- c("employment","housing","services","environment") 
res.mfamix<-MFAmix(data=dat,groups=index,
                   name.groups=names,ndim=3,rename.level=TRUE,graph=FALSE)

## ------------------------------------------------------------------------
class(res.mfamix)
res.mfamix

## ----out.width='70%'-----------------------------------------------------
?plot.MFAmix
par(mfrow=c(2,2))
plot(res.mfamix, choice="cor",coloring.var="groups",leg=TRUE,
     main="(a) Numerical variables")
plot(res.mfamix,choice="ind", partial=c("SAINTE-FOY-LA-GRANDE"), label=TRUE,
     posleg="topright", main="(b) Observations")
plot(res.mfamix,choice="sqload",coloring.var="groups",
     posleg="topright",main="(c) All variables")
plot(res.mfamix, choice="groups", coloring.var="groups",
     main="(c) Groups")

## ------------------------------------------------------------------------
coord.var <- res.mfamix$quanti$coord[,1:2]
subset(coord.var,abs(coord.var[,1])>0.5,1)
subset(coord.var,abs(coord.var[,2 ])>0.5,2)

## ----out.width='50%'-----------------------------------------------------
plot(res.mfamix, choice="levels", coloring.var="groups",
     posleg="bottomleft", main="(c) Levels",xlim=c(-2,4))

## ------------------------------------------------------------------------
sel <- which(rownames(dat)=="SAINTE-FOY-LA-GRANDE")
res.mfamix<- MFAmix(data=dat[-sel,],groups=index,
                   name.groups=names,rename.level=TRUE,graph=FALSE)
pred <- predict(res.mfamix,dat[sel,,drop=FALSE])
pred[,1:2,drop=FALSE]

## ----out.width='50%'-----------------------------------------------------
plot(res.mfamix,axes=c(1,2),label=FALSE,main="Observations map",
     ylim=c(-5,1.5),cex=0.8)
points(pred[,1:2,drop=FALSE],col=2,pch=16)
text(pred,"SAINTE-FOY-LA-GRANDE",col=2,cex=0.7,pos=2)
selplot <- which(res.mfamix$ind$coord[,1]>4.2)
text(res.mfamix$ind$coord[selplot,1:2],rownames(dat[-sel,])[selplot],col=1,cex=0.7,pos=2)
legend("topright",legend = c("active","illustrative"),fill=1:2,col=1:2)

## ------------------------------------------------------------------------
dat <- cbind(gironde$employment,gironde$services,gironde$environment) 
names <- c("employment","services","environment") 
mfa <-MFAmix(data=dat,groups=c(rep(1,9),rep(2,9),rep(3,4)),
                   name.groups=names, rename.level=TRUE,graph=FALSE)
mfa.sup <- supvar(mfa,data.sup=gironde$housing, groups.sup=rep(1,5),
                name.groups.sup="housing.sup",rename.level=TRUE)

## ----out.width='50%'-----------------------------------------------------
#par(mfrow=c(1,2))
plot(mfa.sup,choice="groups",coloring.var="groups")
plot(mfa.sup,choice="cor",coloring.var = "groups")

