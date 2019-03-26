## ---- eval=T, echo=T-----------------------------------------------------
library(SDMPlay)
data("ctenocidaris.nutrix")
head(ctenocidaris.nutrix)

## ---- eval=T, echo=F, warning=FALSE, message=FALSE-----------------------
library(raster)
library(SDMPlay)
predictors2005_2012 <- raster::stack(system.file("vignette_data","predictors2005_2012_ker.grd",package="SDMPlay"))
par(mar=c(0,0,0,0))

## ---- eval=F, echo=T-----------------------------------------------------
#  data("predictors1965_1974")
#  data("predictors2005_2012")
#  data("predictors2200A1B")

## ---- eval=F, echo=T, fig.height=5, fig.width=6, fig.align='center'------
#  library(raster)
#  plot(subset(predictors2005_2012, c(1:4)))

## ---- eval=T, echo=F, fig.height=5, fig.width=6, fig.align='center'------
library(raster)
plot(subset(predictors2005_2012, c(1:4)),cex.axis=0.7, cex.main=0.8,
     legend.width=1, legend.shrink=0.5)

## ---- eval=T, echo=T-----------------------------------------------------
predictors2005_2012
names(predictors2005_2012)

## ---- eval=T, echo=T-----------------------------------------------------
ctenocidaris.nutrix.occ <- ctenocidaris.nutrix[,c(7,8)]
head(ctenocidaris.nutrix.occ)

## ---- eval=T, echo=F-----------------------------------------------------
SDMtable_ctenocidaris <- SDMPlay:::SDMtab(xydata=ctenocidaris.nutrix.occ, 
       predictors=predictors2005_2012,
       unique.data=FALSE,
       same=TRUE)

## ---- eval=F, echo=T-----------------------------------------------------
#  SDMtable_ctenocidaris <- SDMtab(xydata=ctenocidaris.nutrix.occ,
#         predictors=predictors2005_2012,
#         unique.data=FALSE,
#         same=TRUE)

## ---- eval=T, echo=T-----------------------------------------------------
head(SDMtable_ctenocidaris[,c(1:5)])
tail(SDMtable_ctenocidaris[,c(1:5)])

## ---- eval=T, echo=F-----------------------------------------------------
par(mar=c(0,0,0,0))

## ---- eval=T, echo=T, fig.height=5, fig.width=5, fig.align='center'------
# nice colors 
bluepalette<-colorRampPalette(c("blue4","blue","dodgerblue", "deepskyblue","lightskyblue"))(800) 

# Isolate depth layer from the environmental stack
depth <- subset(predictors2005_2012,1)

# Extract background coordinates from SDMtable
background.occ <- subset(SDMtable_ctenocidaris,SDMtable_ctenocidaris$id==0)[,c(2,3)]
# plot the result on depth layer
plot(depth, col=bluepalette, cex=0.8,legend.width=0.5, legend.shrink=0.4,
     legend.args=list(text='Depth (m)', side=3, font=2, cex=0.8))
points(ctenocidaris.nutrix.occ, pch= 20, col="black")
points(background.occ, pch= 20, col="red")
legend("bottomleft", pch=20, col=c("black", "red"), legend=c("presence-only data","background data"), cex=0.6)


## ---- eval=F, echo=T-----------------------------------------------------
#  SDMdata.quality(SDMtable_ctenocidaris)

## ---- eval=T, echo=F-----------------------------------------------------
SDMPlay:::SDMdata.quality(SDMtable_ctenocidaris)

## ---- eval=F, echo=T, fig.height=4, fig.width=4, fig.align='center'------
#  par(mar=c(0,0,0,0))
#  # restrict to 1500m depth
#  predictors2005_2012_1500m <- delim.area(predictors2005_2012, longmin=62, longmax=80,latmin=-55 , latmax=-45, interval=c(0,-1500))
#  # plot the new layer
#  plot(subset(predictors2005_2012_1500m,1), col=bluepalette,legend.width=0.5, legend.shrink=0.25,
#       legend.args=list(text='Depth (m)', side=3, font=2, cex=0.8))

## ---- eval=T, echo=F, fig.height=5, fig.width=5, fig.align='center'------
predictors2005_2012_1500m <- SDMPlay:::delim.area(predictors2005_2012, longmin=62, longmax=80,latmin=-55 , latmax=-45, interval=c(0,-1500))
plot(subset(predictors2005_2012_1500m,1), col=bluepalette,legend.width=0.5, legend.shrink=0.4,
     legend.args=list(text='Depth (m)', side=3, font=2, cex=0.8))

## ---- eval=T, echo=F-----------------------------------------------------
SDMtable_ctenocidaris_1500 <- SDMPlay:::SDMtab(xydata=ctenocidaris.nutrix.occ, 
       predictors=predictors2005_2012_1500m,
       unique.data=FALSE,
       same=TRUE)

## ---- eval=F, echo=T-----------------------------------------------------
#  SDMtable_ctenocidaris_1500 <- SDMtab(xydata=ctenocidaris.nutrix.occ,
#         predictors=predictors2005_2012_1500m,
#         unique.data=FALSE,
#         same=TRUE)

## ---- eval=T, echo=F, fig.height=5, fig.width=5, fig.align='center'------
background.occ_1500 <- subset(SDMtable_ctenocidaris_1500,SDMtable_ctenocidaris_1500$id==0)[,c(2,3)]
plot(subset(predictors2005_2012_1500m,1), col=bluepalette, cex=0.8, legend.width=0.5, legend.shrink=0.4,
     legend.args=list(text='Depth (m)', side=3, font=2, cex=0.8))
points(ctenocidaris.nutrix.occ, pch= 20, col="black")
points(background.occ_1500, pch= 20, col="red")
legend("bottomleft", pch=20, col=c("black", "red"), legend=c("presence-only data","background data"), cex=0.6)


## ---- eval=F,echo=T------------------------------------------------------
#  compute.brt(x, proj.predictors, tc = 2, lr = 0.001, bf = 0.75,
#             n.trees = 50, step.size = n.trees)
#  compute.maxent(x, proj.predictors)

## ---- message=FALSE, warning=FALSE, echo=T, eval=T, results="hide", fig.height=4, fig.width=4, fig.align='center'----
Cteno_model_2005_2012 <- SDMPlay:::compute.brt(x=SDMtable_ctenocidaris_1500, proj.predictors=predictors2005_2012_1500m, tc = 2, lr = 0.001, bf = 0.75, n.trees = 500)

## ---- fig.height=5, fig.width=5, fig.align='center'----------------------
# display nice colors
palettecolor <- colorRampPalette(c("deepskyblue", "darkseagreen","lightgreen","green","yellow","gold","orange", "red","firebrick"))(100)
# plot the results 
plot(Cteno_model_2005_2012$raster.prediction,col=palettecolor, main="Projection for [2005-2012]",
     cex.axis= 0.7, 
     legend.width=0.5, legend.shrink=0.25,
     legend.args=list(text='Distribution probability', side=3, font=2, cex=0.8))


## ---- fig.height=5, fig.width=5, fig.align='center'----------------------
contributions <- Cteno_model_2005_2012$response$contributions
b <- barplot(contributions[,2], ylab="contribution (%)")
text(b-0.1, par("usr")[3] - 0.025, srt = 45, adj = 1, labels=contributions[,1],cex=0.5,xpd=T)

## ---- fig.height=5, fig.width=5, fig.align='center', message=F-----------
library(dismo)
gbm.plot(Cteno_model_2005_2012$response,n.plots=12,cex.axis=0.6,cex.lab=0.7, smooth=TRUE)

## ---- fig.height=4, fig.width=5, fig.align='center', message=FALSE-------
interactions <- gbm.interactions(Cteno_model_2005_2012$response)
head(interactions$rank.list[,c(5,2,4)])
gbm.perspec(Cteno_model_2005_2012$response,interactions$rank.list[1,1],interactions$rank.list[1,3], cex.lab=0.6, cex.axis=0.6,par(mar=c(0,0,0,0)))


