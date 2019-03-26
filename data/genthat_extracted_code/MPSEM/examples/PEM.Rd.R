library(MPSEM)


### Name:  PEM 
### Title: Phylogenetic Eigenvector Map
### Aliases: ' PEMInfluence ' ' PEMweights ' ' PEM.build ' ' PEM.updater '
###   ' PEM.fitSimple ' ' PEM.forcedSimple ' ' getGraphLocations ' '
###   getAncGraphLocations ' ' Locations2PEMscores '

### ** Examples

t1 <- read.tree(text=paste("(((A:0.15,B:0.2)N4:0.15,C:0.35)N2:0.25,((D:0.25,E:0.1)N5:0.3,",
                           "(F:0.15,G:0.2)N6:0.3)N3:0.1)N1;",sep=""))
x <- Phylo2DirectedGraph(t1)
#
## Calculates the (binary) influence matrix
PEMInfluence(x)
PEMInfluence(x)[x$vertex$species,]
#
## Building phylogenetic eigenvector maps
PEM1 <- PEM.build(x)
print(PEM1)
PEM2 <- PEM.build(x, a = 0.2)
PEM3 <- PEM.build(x, a = 1)
PEM4 <- PEM.updater(PEM3,a=0.5)
#
## Extracts the eigenvectors
as.data.frame(PEM4)
#
### Example of an hypothetical set of trait values
y <- c(A=-1.1436265,B=-0.3186166,C=1.9364105,D=1.7164079,E=1.0013993,
       F=-1.8586351,G=-2.0236371)
#
## Estimate single steepness parameter for the whole tree.
PEMfs1 <- PEM.fitSimple(y=y,x=NULL,w=x,d="distance",sp="species",lower=0,upper=1)
PEMfs1$optim       # Results of the optimization.
#
## Force neutral evolution for the whole tree.
PEMfrc1 <- PEM.forcedSimple(y=y,x=NULL,w=x,d="distance",sp="species",a=0)
PEMfrc1$x$edge$a   # Steepness parameter forced for each individual edge.
#
## Get graph locations for target species X, Y, and Z
tpAll <- read.tree(text=paste("((X:0.45,((A:0.15,B:0.2)N4:0.15,",
                              "(C:0.25,Z:0.2)NZ:0.1)N2:0.05)NX:0.2,",
                              "(((D:0.25,E:0.1)N5:0.05,Y:0.25)NY:0.25,",
                              "(F:0.15,G:0.2)N6:0.3)N3:0.1)N1;",sep=""))
grloc <- getGraphLocations(tpAll, c("X","Y","Z"))
#
PEMfs2 <- PEM.fitSimple(y=y,x=NULL,w=grloc$x,d="distance",sp="species",lower=0,upper=1)
PEMfs2$optim       # Same as for PEMfs1$optim
#
PEMsc1 <- Locations2PEMscores(PEMfs2, grloc)
lm1 <- lm(y~V_2+V_3+V_5,data=PEMfs2)
#
ypred <- predict(object=PEMfs2,targets=grloc,lmobject=lm1,interval="none")
#
tpModel <- drop.tip(tpAll,c("X","Y","Z"))
#
## Plotting the results:
layout(t(c(1,1,2)))
par(mar=c(6,2,2,0.5)+0.1)
plot(tpModel,show.tip.label=TRUE,show.node.label=TRUE,root.edge = TRUE,
     srt = 0,adj=0.5,label.offset=0.08,font=1,cex=1.5,xpd=TRUE)
edgelabels(paste("E",1:nrow(tpModel$edge),sep=""),
           edge=1:nrow(tpModel$edge),bg="white",font=1,cex=1)
points(x=0.20,y=2.25,pch=21,bg="black")
lines(x=c(0.20,0.20,0.65),y=c(2.25,0.55,0.55),xpd=TRUE,lty=2)
text("X",x=0.69,y=0.55,xpd=TRUE,font=1,cex=1.5)
points(x=0.35,y=4.5,pch=21,bg="black")
lines(x=c(0.35,0.35,0.6),y=c(4.5,5.47,5.47),xpd=TRUE,lty=2)
text("Y",x=0.64,y=5.47,xpd=TRUE,font=1,cex=1.5)
points(x=0.35,y=3,pch=21,bg="black")
lines(x=c(0.35,0.35,0.55),y=c(3,3.5,3.5),xpd=TRUE,lty=2)
text("Z",x=0.59,y=3.5,xpd=TRUE,font=1,cex=1.5)
text(c("NX","NY","NZ"),x=c(0.20,0.35,0.35),y=c(2.25,4.5,3)+0.3*c(1,-1,-1),font=1,cex=1)
add.scale.bar(length=0.1,cex=1.25)
par(mar=c(3.75,0,2,2)+0.1)
plot(x=y,y=1:7,ylim=c(0.45,7),xlim=c(-4,4), axes=FALSE, type="n", xlab="")
axis(1,label=c("-4","-2","0","2","4"),at=c(-4,-2,0,2,4)) ; abline(v=0)
points(x=y,y=1:7,xlim=c(-2,2),pch=21,bg="black")             # Observed values
text("B)",x=-3.5,y=7,cex=1.5,xpd=TRUE) ; text("Trait value",x=0,y=-0.5,cex=1.25,xpd=TRUE)
points(x=ypred,y=c(0.5,5.5,3.5),pch=23,bg="white",cex=1.25)  # Predicted values
#
## Estimating ancestral trait values:
ANCloc <- getAncGraphLocations(x)
PEMfsAnc <- PEM.fitSimple(y=y,x=NULL,w=ANCloc$x,d="distance",sp="species",lower=0,upper=1)
PEMfsAnc$optim
#
PEManc1 <- Locations2PEMscores(PEMfsAnc, ANCloc)
y_anc <- predict(object=PEMfsAnc,targets=ANCloc,lmobject=lm1,interval="confidence")
#



