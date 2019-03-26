## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(knitr)
library(divDyn)

## ----package, echo= TRUE, eval=FALSE-------------------------------------
#  library(divDyn)

## ----dat, echo= TRUE-----------------------------------------------------
# attach the time scale object
data(stages)

## ----tsplot1, echo= TRUE, plot=TRUE, fig.height=5.5----------------------
tsplot(stages, boxes="sys", shading= "series")

## ----tsplot2, echo= TRUE, plot=TRUE, fig.height=5.5----------------------
tsplot(stages, boxes="system", shading="stage", xlim=59:81)

## ----tsplot3, echo= TRUE, plot=TRUE, fig.height=5.5----------------------
tsplot(stages, boxes="sys", shading="series", 
  labels.args=list(col="red", font=3), shading.col=c("white", "wheat"))

## ----tsplot4, echo= TRUE, plot=TRUE, fig.height=5.5----------------------
tsplot(stages, boxes=c("sys"), shading="sys", boxes.col="systemCol")

## ----tsplot5, echo= TRUE, plot=TRUE, fig.height=5.5----------------------
tsplot(stages, boxes=c("short","system"), shading="short", 
  xlim=59:69, boxes.col=c("col","systemCol"), labels.args=list(cex=0.5))

## ----tsplot6, echo= TRUE, plot=TRUE, fig.height=5.5----------------------
tsplot(stages, boxes=c("short","system"), shading="short", 
  xlim=59:69, boxes.col=c("col","systemCol"),
  labels.args=list(list(cex=0.5),list(cex=1)),
  boxes.args=list(list(),list(density=80)))

## ----examp, echo= FALSE, results=TRUE------------------------------------
structure <- data.frame(
  tax= c("Sp1", "Sp1", "Sp1", "Sp2","Sp3", "Sp2"),
  bin= c(1,1,2, 2,2,3),
  locality = c("first", "second", "second", "second", "first", "second"))
  
  structure

## ----corDat, echo= TRUE--------------------------------------------------
data(corals)

## ----fossils, echo= TRUE, results=TRUE-----------------------------------
fossils <- corals[corals$stg!=95,]
# the number of occurrences
nrow(fossils)

## ----fadlad, echo= TRUE, results=FALSE-----------------------------------
fl <- fadlad(fossils, bin="stg", tax="genus")

## ----ranplot, echo= TRUE, plot=TRUE, fig.height=5.5----------------------
fossils$mid <- stages$mid[fossils$stg]

tsplot(stages, shading="series", boxes="sys",xlim=c(260,0))

ranges(fossils, tax="genus", bin="mid")

## ----ranplot2, echo= TRUE, plot=TRUE, fig.height=5.5---------------------
tsplot(stages, shading="series", boxes="series",xlim=c(100,81))

ranges(fossils, tax="genus", bin="mid", labs=T, labels.args=list(cex=0.2))

## ----ranplot3, echo= TRUE, plot=TRUE, fig.height=5.5---------------------
tsplot(stages, shading="stage", boxes=c("stage","series"),xlim=c(100,81))

ranges(fossils, tax="genus", bin="mid", labs=T, 
  labels.args=list(cex=0.6), filt="orig", occs=T)

## ----ranplot4, echo= TRUE, plot=TRUE, fig.height=5.5---------------------
tsplot(stages, shading="stage", boxes=c("stage","series"),xlim=c(100,81))

ranges(fossils, tax="genus", bin="mid", labs=T, 
  labels.args=list(cex=0.6), filt="orig", occs=T, group="ecology")

## ----surv, echo= TRUE, results=FALSE-------------------------------------
surv <- survivors(corals, bin="stg", tax="genus")

## ----survTsplotblank, echo=TRUE, plot=TRUE, fig.height=5.5---------------
# time scale plot
tsplot(stages, shading="series", boxes="sys", 
  xlim=c(260,0), ylab="proportion of survivors present",
  ylim=c(0.01,1),plot.args=list(log="y"))

## ----survTsplotShow, echo=TRUE, eval=FALSE-------------------------------
#  # lines for every cohort
#  for(i in 1:ncol(surv)) lines(stages$mid, surv[,i])

## ----survTsplot1, echo=FALSE, plot=TRUE, fig.height=5.5------------------
# time scale plot
tsplot(stages, shading="series", boxes="sys", xlim=c(260,0),
  ylab="proportion of survivors present", 
  ylim=c(0.01,1),plot.args=list(log="y"))
# lines for every cohort
for(i in 1:ncol(surv)) lines(stages$mid, surv[,i])

## ----survTsplot2, echo=FALSE, plot=TRUE, fig.height=5.5------------------
survFor<-survivors(corals, tax="genus", bin="stg", method="backward")
# plot
tsplot(stages, shading="series", boxes="sys", 
  xlim=c(260,0), ylab="proportion of constituents present",
  ylim=c(0.001,1),plot.args=list(log="y"))
# for every cohort
for(i in 1:ncol(surv)) lines(stages$mid, survFor [,i])

## ----sampTOT, echo=TRUE, result=TRUE-------------------------------------
samp <-sumstat(fossils, tax="genus", bin="stg", 
  coll="collection_no", ref="reference_no", duplicates=FALSE)
samp

## ----binstat, echo=TRUE, result=FALSE------------------------------------
samp <-binstat(fossils, tax="genus", bin="stg", 
  coll="collection_no", ref="reference_no")

## ----binstatInd, echo=TRUE, result=FALSE---------------------------------
samp <-binstat(fossils, tax="genus", bin="stg", 
  coll="collection_no", ref="reference_no", indices=TRUE)
colnames(samp)

## ----occsAndColls, echo=TRUE, result=FALSE, plot=TRUE, fig.height=5.5----
par(mar=c(4,4,2,4))
# basic plot
tsplot(stages, shading="series", boxes="sys", xlim=51:95,
    ylab="number of occurrences", ylim=c(0,3000))
lines(stages$mid[1:94], samp$occs)
# the collections (rescaled, other axis)
  lines(stages$mid[1:94], samp$colls*5, col="blue")
  axis(4, col="blue",col.ticks="blue",col.axis="blue",
    at=seq(0,3000,500), labels=seq(0,600,100))
  mtext(4, text="number of collections", col="blue", line=2)

## ----parts, echo=TRUE, result=FALSE, plot=TRUE, fig.height=5.5-----------
# numerical ages, as bins
fossils$stgMid <- stages$mid[fossils$stg]
#plotting
tsplot(stages, shading="series", boxes="sys", xlim=51:95,
  ylab="number of occurences", ylim=c(0,3000))
parts(fossils$stgMid, fossils$bath)

## ----parts2, echo=TRUE, result=FALSE, plot=TRUE, fig.height=5.5----------
cols <- c("#FF0000AA", "#00FF00AA", "#0000FFAA")
# reorder too
reord <- c("shal","deep","uk")
plotnames <-c("shallow", "deep", "unknown")
tsplot(stages, shading="series", boxes="sys", xlim=51:95,
    ylab="the number of occurrences", ylim=c(0,3000))
parts(fossils$stgMid, fossils$bath, col=cols, ord=reord, labs=F)
legend("topleft", inset=c(0.01, 0.01), 
  legend= plotnames, fill=cols, bg="white")

## ----parts3, echo=TRUE, result=FALSE, plot=TRUE, fig.height=5.5----------
tsplot(stages, shading="series", boxes="sys", xlim=51:95,
    ylab="proportion of occurrences", ylim=c(0,1))
parts(fossils$stgMid, fossils$bath, prop=T, col=cols, ord=reord, labs=F)
legend("bottomleft", inset=c(0.01, 0.1), 
  legend= plotnames, fill=cols, bg="white")

## ----omit, echo=TRUE, result=TRUE----------------------------------------
omitColl <- omit(corals, bin="stg", tax="genus", om="coll")
omitRef <- omit(corals, bin="stg", tax="genus", om="ref")
omitBinref <- omit(corals, bin="stg", tax="genus", om="binref")
# the conserved number of occurrences will be
sum(!omitColl)
sum(!omitRef)
sum(!omitBinref)

## ----ddFirst, echo=TRUE, result=FALSE------------------------------------
ddFirst<-divDyn(corals, bin="stg", tax="genus", noNAStart=TRUE)

## ----ddRec, echo=TRUE, result=FALSE, plot=TRUE, fig.height=5.5-----------
# metrics
ddRec <-divDyn(corals, bin="stg", tax="genus")
# basic plot
  tsplot(stages, shading="series", boxes="sys", xlim=51:95,
    ylab="range-through richness (diversity)", ylim=c(0,250))
# lines
  lines(stages$mid, ddRec$divRT, col="black", lwd=2)

## ----ddFossils, echo=TRUE, result=FALSE, plot=TRUE, fig.height=5.5-------
# metrics
dd <-divDyn(fossils, bin="stg", tax="genus")
# basic plot
  tsplot(stages, shading="series", boxes="sys", xlim=51:95,
    ylab="richness (diversity)", ylim=c(0,250))
# lines
  lines(stages$mid, ddRec$divRT, col="black", lwd=2)
  lines(stages$mid[1:94], dd$divRT, col="blue", lwd=2)
# legend
  legend("topleft", legend=c("with recent", "without recent"), col=c("black", "blue"), lwd=c(2,2), bg="white")

## ----ddDiv, echo=TRUE, result=FALSE, plot=TRUE, fig.height=5.5-----------
# metrics
dd <-divDyn(fossils, bin="stg", tax="genus")
# basic plot
  tsplot(stages, shading="series", boxes="sys", xlim=51:95,
    ylab="richness (diversity)", ylim=c(0,250))
# lines
  lines(stages$mid[1:94], dd$divRT, col="red", lwd=2)
  lines(stages$mid[1:94], dd$divBC, col="blue", lwd=2)
  lines(stages$mid[1:94], dd$divSIB, col="green", lwd=2)
# legend
  legend("topleft", legend=c("RT", "BC", "SIB"), 
    col=c("red", "blue",   "green"), lwd=c(2,2,2), bg="white")

## ----samp3t, echo=TRUE, result=FALSE, plot=TRUE, fig.height=5.5----------
# basic plot
  tsplot(stages, shading="series", boxes="sys", xlim=51:95,
    ylab="three-timer sampling completeness")
  # lines
  lines(stages$mid[1:94], dd$samp3t, col="black", lwd=2)

## ----ddCorr, echo=TRUE, result=FALSE, plot=TRUE, fig.height=5.5----------
# basic plot
  tsplot(stages, shading="series", boxes="sys", xlim=51:95,
    ylab="three-timer sampling completeness", ylim=c(0,250))
  lines(stages$mid[1:94], dd$divSIB, col="black", lwd=2)
  lines(stages$mid[1:94], dd$divCSIB, col="blue", lwd=2)
# legend
  legend("topleft", legend=c("SIB", "corrected SIB" ), 
    col=c("black", "blue"), lwd=c(2,2), bg="white")

## ----ddExt, echo=TRUE, result=FALSE, plot=TRUE, fig.height=5.5-----------
# basic plot
  tsplot(stages, shading="series", boxes="sys", xlim=51:95,
    ylab="extinction rates", ylim=c(0,2))
  lines(stages$mid[1:94], dd$extPC, col="black", lwd=2)
  lines(stages$mid[1:94], dd$extGF, col="blue", lwd=2)
  lines(stages$mid[1:94], dd$ext2f3, col="green", lwd=2)
  # legend
  legend("topleft", legend=c("per capita", "gap-filler", "second-for-third"),
    col=c("black", "blue", "green"), lwd=c(2,2,2), bg="white")

## ----selPrim, echo=TRUE, results=TRUE, plot=TRUE, fig.height=5.5---------
# split by ecology (az = azooxanthellate, z = zooxantehllate)
  z<- fossils[fossils$ecology=="z",]
  az<- fossils[fossils$ecology=="az",]

# calculate diversity dynamics
  ddZ<-divDyn(z, tax="genus", bin="stg")
  ddAZ<-divDyn(az, tax="genus", bin="stg")

# origination rate plot
tsplot(stages, boxes="sys", shading="series", xlim=54:95, 
  ylab="raw per capita originations")
lines(stages$mid[1:94], dd$oriPC, lwd=2, lty=1, col="black")
lines(stages$mid[1:94], ddZ$oriPC, lwd=2, lty=1, col="blue")
lines(stages$mid[1:94], ddAZ$oriPC, lwd=2, lty=2, col="red")
legend("topright", inset=c(0.1,0.1), legend=c("total", "z", "az"), 
  lwd=2, lty=c(1,1,2), col=c("black", "blue", "red"), bg="white")

## ----selFirst, echo=TRUE, results=TRUE, plot=TRUE, fig.height=5.5--------
rs<-ratesplit(fossils, sel="ecology", tax="genus", bin="stg")
rs

## ----sel2, echo=TRUE, results=TRUE, plot=TRUE, fig.height=5.5------------
rsBin95<-ratesplit(fossils, sel="ecology", tax="genus", 
  bin="stg", method="binom")
rsBin95
rsBin90<-ratesplit(fossils, sel="ecology", tax="genus", 
  bin="stg", method="binom", alpha=0.1)
rsBin90

## ----sel3, echo=TRUE, results=TRUE, plot=TRUE, fig.height=5.5------------
rsAIC0.5<-ratesplit(fossils, sel="ecology", tax="genus", 
  bin="stg", alpha=0.5)
rsAIC0.5

## ----selDot, echo=TRUE, eval=FALSE, plot=FALSE---------------------------
#  # select rate values in the intervals of selectivity
#  selIntervals<-cbind(ddZ$oriPC, ddAZ$oriPC)[rs$ori,]
#  # which is higher? TRUE: AZ, FALSE: Z
#  groupSelector<-apply(selIntervals, 1, function(x) x[1]<x[2])
#  # draw the points
#  # for the AZ corals
#  points(
#    stages$mid[rs$ori[groupSelector]],
#    ddAZ$oriPC[rs$ori[groupSelector]],
#    pch=16, col="red", cex=2)
#  # for the Z corals
#  points(
#    stages$mid[rs$ori[!groupSelector]],
#    ddZ$oriPC[rs$ori[!groupSelector]],
#    pch=16, col="blue", cex=2)

## ----selDotShow, echo=FALSE, results=TRUE, plot=TRUE, fig.height=5.5-----
# split by ecology
  z<- fossils[fossils$ecology=="z",]
  az<- fossils[fossils$ecology=="az",]

# calculate diversity dynamics
  ddZ<-divDyn(z, tax="genus", bin="stg")
  ddAZ<-divDyn(az, tax="genus", bin="stg")

# origination rate plot
tsplot(stages, boxes="sys", shading="series", xlim=54:95, 
  ylab="raw sys capita originations")
lines(stages$mid[1:94], dd$oriPC, lwd=2, lty=1, col="black")
lines(stages$mid[1:94], ddZ$oriPC, lwd=2, lty=1, col="blue")
lines(stages$mid[1:94], ddAZ$oriPC, lwd=2, lty=2, col="red")
legend("topright", inset=c(0.1,0.1), legend=c("total", "z", "az"), 
  lwd=2, lty=c(1,1,2), col=c("black", "blue", "red"), bg="white")
# select rate values in the intervals of selectivity
selIntervals<-cbind(ddZ$oriPC, ddAZ$oriPC)[rs$ori,]
# which is higher? TRUE: AZ, FALSE: Z
groupSelector<-apply(selIntervals, 1, function(x) x[1]<x[2])
# draw the points
points(
  stages$mid[rs$ori[groupSelector]], 
  ddAZ$oriPC[rs$ori[groupSelector]],
  pch=16, col="red", cex=2)
points(
  stages$mid[rs$ori[!groupSelector]], 
  ddZ$oriPC[rs$ori[!groupSelector]],
  pch=16, col="blue", cex=2)

## ----ddMid, echo=TRUE, result=FALSE, plot=TRUE, fig.height=5.5-----------
fossils$mid_ma<- apply(fossils[,c("max_ma","min_ma")], 1, mean)

## ----ddNegMid, echo=TRUE, result=FALSE-----------------------------------
fossils$mid_ma<- - fossils$mid_ma 

## ----ddID, echo=TRUE, result=FALSE---------------------------------------
ddIDbin <- divDyn(fossils, tax="genus", bin="mid_ma")

## ----ddBasic, echo=TRUE, result=FALSE, plot=TRUE, fig.height=5.5---------
# basic plot
  tsplot(stages, shading="series", boxes="sys", xlim=51:95,
    ylab="Diversity, range-through", ylim=c(0,300))
  lines(-ddIDbin$bin, ddIDbin$divRT, col="black", lwd=2)
  lines(stages$mid[1:94], dd$divRT, col="red", lwd=2)
legend("topleft", legend=c("unique mid entries",  "stg stages"),
  col=c("black", "red"), lwd=c(2,2), bg="white")

## ----dd10, echo=TRUE, result=FALSE, plot=TRUE, fig.height=5.5------------
# resolve time
  breakPoints <- seq(-270, 0, 10)
# and calculate diversity dynamics
  ddMid10<-divDyn(fossils, tax="genus", bin="mid_ma", breaks=breakPoints)

## ----dd10Show, echo=TRUE, eval=FALSE-------------------------------------
#  # lines
#  lines(-ddMid10$bin, ddMid10$divRT, col="blue", lwd=2)
#  # new legend
#  legend("topleft", legend=c("age estimates, 10MY",
#    "stg stages", "unique mid entries"), col=c("blue", "red", "black"),
#    lwd=c(2,2,2), bg="white")

## ----dd10actual, echo=FALSE, result=FALSE, plot=TRUE, fig.height=5.5-----
# basic plot
  tsplot(stages, shading="series", boxes="sys", xlim=51:95,
    ylab="Diversity, range-through", ylim=c(0,300))
  lines(-ddIDbin$bin, ddIDbin$divRT, col="black", lwd=2)
  lines(stages$mid[1:94], dd$divRT, col="red", lwd=2)
  lines(-ddMid10$bin, ddMid10$divRT, col="blue", lwd=2)
   legend("topleft", legend=c("age estimates, 10MY",  
    "stg stages", "unique mid entries"), 
    col=c("blue", "red", "black"), lwd=c(2,2,2), bg="white")

## ----modelta, echo=TRUE--------------------------------------------------
# basic function call
  mtab <-  modeltab(corals, tax="genus", bin="stg") 
  mtab[mtab[,"genus"]=="Acanthogyra",]

## ----modelta2, echo=TRUE-------------------------------------------------
# basic function call
  mtabrt <- modeltab(corals, tax="genus", bin="stg", rt=TRUE) 
  mtabrt[mtabrt[,"genus"]=="Acanthogyra",]

## ----modelta3, echo=TRUE-------------------------------------------------
# function call with additional taxon-specific variables
  modTab<- modeltab(corals, tax="genus", bin="stg", 
    rt=TRUE, taxvars=c("ecology", "growth")) 
  modTab[1:10,]

## ----modelta4, echo=TRUE-------------------------------------------------
  simpleMod<- glm(ext ~ ecology + growth, family="binomial", data=modTab)

## ----sampCor, echo=TRUE, result=TRUE-------------------------------------
sam <-binstat(fossils, bin="stg", tax="genus", coll="collection_no", duplicates=F)
cor.test(dd$divRT, sam$occs, method="spearman")
cor.test(dd$divSIB, sam$occs, method="spearman")

## ----ddCRBasic, echo=TRUE, results=FALSE, plot=TRUE, fig.height=5.5------
# basic plot
  tsplot(stages, shading="series", boxes="sys", xlim=51:95,
    ylab="SIB diversity", ylim=c(0,200))
# raw diversity
  lines(stages$mid[1:94], dd$divCSIB, col="black", lwd=2)
# subsampling
  # with 40 occs.
  subCR40 <-subsample(fossils, bin="stg", tax="genus", q=40)
  lines(stages$mid[1:94], subCR40$divCSIB, col="blue", lwd=2)
  # with 80 occs.
  subCR80 <-subsample(fossils, bin="stg", tax="genus", q=80)
  lines(stages$mid[1:94], subCR80$divCSIB, col="red", lwd=2)

# legend
  legend("topleft", legend=c("raw", "CR, q = 40","CR, q = 80"),
    col=c("black", "blue", "red"), lwd=c(2,2,2), bg="white")

## ----subIter, echo=TRUE, results =FALSE, plot=TRUE, fig.height=5.5-------
# basic plot
  tsplot(stages, shading="series", boxes="sys", xlim=51:95,
    ylab="genus richness (corrected SIB)", ylim=c(0,200))
  lines(stages$mid[1:94], dd$divCSIB, col="black", lwd=2)
## subsampled, stable  
  subStab <-subsample(fossils, bin="stg", tax="genus", iter=100, q=30)
  lines(stages$mid[1:94], subStab$divCSIB, col="blue", lwd=2)
## subsampled, unstable  
  subInstab <-subsample(fossils, bin="stg", tax="genus", iter=5, q=30)
  lines(stages$mid[1:94], subInstab$divCSIB, col="red", lwd=2)
# legend
  legend("topleft", legend=c("raw", "CR, q=30, stable",
    "CR, q=30, unstable"), col=c("black", "blue", "red"), 
    lwd=c(2,2,2), bg="white")

## ----subDupl, echo=TRUE, results =FALSE, plot=TRUE, fig.height=5.5-------
## subsampled, stable  
  subCRnd <- subsample(fossils, bin="stg", tax="genus", 
    coll="collection_no", iter=100, q=40, duplicates=FALSE)
# basic plot
  tsplot(stages, shading="series", boxes="sys", xlim=51:95,
    ylab="number of occurrences", ylim=c(0,100))
  lines(stages$mid[1:94], subCR40$divCSIB, col="blue", lwd=2)
  lines(stages$mid[1:94], subCRnd$divCSIB, col="black", lwd=2)
  legend("topleft", legend=c("CR, q=40 (with duplicates)",
    "CR, q=40"), col=c("blue", "black"), 
    lwd=c(2,2), bg="white")


## ----omitDupl, echo=TRUE, results =FALSE---------------------------------
# indicate identical collection/genus combinations
collGenus <- paste(fossils$collection_no, fossils$genus)
# omit the duplicates from the occurrence datasets
fossGen <- fossils[!duplicated(collGenus),]

## ----subFail, echo=TRUE, results =FALSE, plot=TRUE, fig.height=5.5-------
# basic plot
  tsplot(stages, shading="series", boxes="sys", xlim=51:95,
    ylab="number of occurrences", ylim=c(0,100))
# subsampled, without failed  
  withoutFail<-subsample(fossGen, bin="stg", tax="genus", 
    iter=100, q=80, useFailed=FALSE)
  lines(stages$mid[1:94], withoutFail$divCSIB, col="black", lwd=2)
# subsampled, with failed 
  withFail <-subsample(fossGen, bin="stg", tax="genus", 
    iter=100, q=80, useFailed=TRUE)
  lines(stages$mid[1:94], withFail$divCSIB, col="blue", lwd=2)
  legend("topleft", legend=c("CR, q=80, without failed",
    "CR, q=100, with failed"), col=c("black", "blue"), 
    lwd=c(2,2), bg="white")

## ----subIntact, echo=TRUE, results =FALSE, plot=TRUE, fig.height=5.5-----
# basic plot
  tsplot(stages, shading="series", boxes="sys", xlim=51:95,
    ylab="per capita extinction rates", ylim=c(0,1))
## subsampled, excluding the recent occurrences  
  sub <- subsample(corals, bin="stg", tax="genus", iter=100, 
    q=50, rem= 95, duplicates=FALSE, coll="collection_no")
  lines(stages$mid[1:94], sub$extPC, col="black", lwd=2)
## subsampled, including the recent
  subPR <- subsample(corals, bin="stg", tax="genus", iter=100, 
    q=50, keep= 95, duplicates=FALSE, coll="collection_no")
  lines(stages$mid, subPR$extPC, col="blue", lwd=2)
# legend
  legend("topleft", legend=c("only fossils", 
    "including the recent\n(not subsampled)"), col=c("black", "blue"),
    lwd=c(2,2), bg="white")

## ----subOutput, echo=TRUE, results =FALSE, plot=TRUE, fig.height=5.5-----
# basic plot
  tsplot(stages, shading="series", boxes="sys", xlim=51:95,
    ylab="richness of genera (corrected SIB)", ylim=c(0,100))
## arithmetic mean output
  subArit <- subsample(fossGen, bin="stg", tax="genus", iter=100, q=40, output="arit")
  lines(stages$mid[1:94], subArit$divCSIB, col="black", lwd=2)
## geometric mean output  
  subGeom <- subsample(fossGen, bin="stg", tax="genus", 
    iter=100, q=40, output="geom")
  lines(stages$mid[1:94], subGeom$divCSIB, col="blue", lwd=2)
  legend("topleft", legend=c("arithmetic means", "geometric means"),
    col=c("black", "blue"), lwd=c(2,2), bg="white")

## ----subDist, echo=TRUE, results=FALSE-----------------------------------
## subsampled, dist output 
  subDist <- subsample(fossGen, bin="stg", tax="genus", 
    iter=100, q=40, output="dist")

## ----subDistVars, echo=TRUE, results=FALSE-------------------------------
# the variables
names(subDist)
# the dimensions of a single variable
dim(subDist$divCSIB)

## ----subMultiRes, echo=TRUE, results =FALSE, plot=TRUE, fig.height=5.5----
tsplot(stages, shading="series", boxes="sys", xlim=51:95,
  ylab="subsampled richness of genera (corrected SIB)", ylim=c(0,150))

plottedVar <- subDist$divCSIB
for(i in 1:ncol(plottedVar)){
  lines(stages$mid[1:94], plottedVar[,i], col="#00000099", lwd=2)
}
# the mean
csibMeans<- apply(plottedVar,1, mean, na.rm=T)
lines(stages$mid[1:94], csibMeans , col="red", lwd=2)

## ----shades, echo=TRUE, results =FALSE, plot=TRUE, fig.height=5.5--------
tsplot(stages, shading="series", boxes="sys", xlim=51:95,
  ylab="subsampled richness of genera (corrected SIB)", ylim=c(0,150))
shades(stages$mid[1:94], plottedVar, res=10, col="black")

## ----shades100, echo=TRUE, results =FALSE, plot=TRUE, fig.height=5.5-----
tsplot(stages, shading="series", boxes="sys", xlim=51:95,
  ylab="subsampled richness of genera (corrected SIB)", ylim=c(0,150))
shades(stages$mid[1:94], plottedVar, col="blue", res=c(0.05,0.25,0.75,0.95))

## ----subApplied, echo=TRUE, results=FALSE--------------------------------
## subsampled 
subData <- subsample(fossGen, bin="stg", tax="genus", 
  iter=100, q=40,FUN= NULL)

## ----subAppliedShow, echo=TRUE, results=TRUE-----------------------------
# characteristics
class(subData)
length(subData)
# columns of the trial dataset
colnames(subData[[1]])

## ----subLapply, echo=TRUE, results =TRUE---------------------------------
OCC <- function(x) table(x$stg)
# list of trials, each contains the number of occurrences in a bin (vector)
subOccs <- lapply(subData, OCC)
# one trial
subOccs [[1]]

## ----subOCC, echo=TRUE, results =FALSE, plot=TRUE, fig.height=5.5--------
OCC <- function(dat) table(dat$stg)
subOccsInternal <- subsample(fossGen, bin="stg", tax="genus", 
  iter=100, q=40,FUN= OCC, output="list")

## ----subOCCShow, echo=TRUE, results =TRUE--------------------------------

subOccsInternal[[1]]

## ----subOCCdist, echo=TRUE, results=FALSE--------------------------------
subDistOccs <- subsample(fossGen, bin="stg", tax="genus", 
  iter=100, q=40,FUN= OCC, output="dist")

## ----subOCCdistShow, echo=TRUE, results =TRUE----------------------------
str(subDistOccs)

## ----rawPL, echo=TRUE, results=TRUE, plot=TRUE, fig.height=5.5-----------
PL <- function(dat){
  tRes<- tapply(INDEX=dat$stg, X=dat$paleolat, FUN=function(y){
    max(abs(y), na.rm=T)
  })
return(tRes)
}
maxPaLat<- PL(fossils)

## ----subPL, echo=TRUE, results =TRUE, plot=TRUE, fig.height=5.5----------
cor.test(maxPaLat, stages$mid[54:94], method="spearman")

## ----subPLSmm, echo=TRUE, results =FALSE, plot=TRUE, fig.height=5.5------
subMaxPaLat <- subsample(fossGen, bin="stg", tax="genus", 
  iter=100, q=20,FUN=PL)
tsplot(stages, shading="series", boxes="sys", xlim=51:95,
  ylab="maximum sampled paleolatitude", ylim=c(0,90))
lines(stages$mid[54:94], maxPaLat, col="blue")
lines(stages$mid[54:94], subMaxPaLat, col="black")
# legend
legend("topleft", legend=c("max",
  "subsampled max"), col=c("blue","black"),
  bg="white", lty=c(1,1))

cor.test(subMaxPaLat, stages$mid[54:94], method="spearman")

## ----subUWunit, echo=TRUE, results =FALSE--------------------------------
subUWunit <- subsample(fossGen, bin="stg", tax="genus", 
  iter=100, q=10, type="cr", unit="collection_no")

## ----subOXW, echo=TRUE, results =FALSE-----------------------------------
subOW <- subsample(fossGen, bin="stg", tax="genus", coll="collection_no",
  iter=100, q=40, type="oxw")

## ----subOW, echo=TRUE, results =FALSE, plot=TRUE, fig.height=5.5---------
subCR <- subsample(fossGen, bin="stg", tax="genus", iter=100, q=40)
tsplot(stages, shading="series", boxes="sys", xlim=51:95,
  ylab="corrected SIB diversity", ylim=c(0,90))
lines(stages$mid[1:94], subCR$divCSIB, col="black")
lines(stages$mid[1:94], subOW$divCSIB, col="blue")
legend("topleft", legend=c("CR - 40", "OW - 40"), 
  col=c("black", "blue"), lwd=c(2,2), bg="white")

## ----oxw, echo=TRUE, results =FALSE--------------------------------------
trialsUW <- subsample(fossGen, bin="stg", tax="genus", coll="collection_no",
  iter=100, q=20, type="oxw", x=0, FUN=binstat)
# the number of sampled collections on average in each timeslice
trialsUW[54:94, "colls"]
subUW <- subsample(fossGen, bin="stg", tax="genus", coll="collection_no",
  iter=100, q=10, type="oxw", x=0)

## ----subST, echo=TRUE, results =FALSE, plot=TRUE, fig.height=5.5---------
subST <- subsample(fossGen, bin="stg", tax="genus", coll="collection_no", 
  iter=100, q=20,FUN=binstat, type="oxw")


## ----subSTshow, echo=TRUE, results =TRUE, plot=TRUE, fig.height=5.5------
subST[54:94, "occs"]

## ----subO2, echo=TRUE, results =FALSE, plot=TRUE, fig.height=5.5---------
subO2W <- subsample(fossGen, bin="stg", tax="genus", coll="collection_no", 
  iter=100, q=80, type="oxw", x=2)
tsplot(stages, shading="series", boxes="sys", xlim=51:95,
  ylab="corrected SIB genus richness", ylim=c(0,90))
lines(stages$mid[1:94], subCR$divCSIB, col="black")
lines(stages$mid[1:94], subOW$divCSIB, col="blue")
lines(stages$mid[1:94], subUW$divCSIB, col="red")
lines(stages$mid[1:94], subO2W$divCSIB, col="green")
legend("topleft", legend=c("CR - 40", "OW - 40", "UW - 10", "O2W - 80"),
  col=c("black", "blue", "red", "green"), lwd=c(2,2), bg="white")

## ----subCRmany, echo=TRUE, results =FALSE, plot=TRUE, fig.height=5.5-----
# repeat CR subsampling for a set of quotas
quotas<-seq(70,10,-10)
for(i in quotas){
   # actual CR 
   cr<-subsample(fossGen, iter=50, q=i,tax="genus", bin="stg", 
    useFailed=FALSE)
  # store output
  assign(paste("cr", i, sep=""), cr)
}

## ----subCRmanyShow, echo=TRUE, results =FALSE, plot=TRUE, fig.height=5.5----
tsplot(stages, shading="series", boxes="sys", xlim=51:95,
  ylab="corrected SIB richness", ylim=c(0,90))
for(i in quotas){
  current <- get(paste("cr", i, sep=""))
  lines(stages$mid[1:94], current $divCSIB, col="red")
}

## ----sqs1, echo=TRUE, results =FALSE, plot=TRUE, fig.height=5.5----------
# sqs with 0.6 quorum
sqs0.6 <-subsample(fossGen, iter=50, q=0.6,
  tax="genus", bin="stg",  type="sqs")
#sqs with 0.3 quorum
sqs0.3 <-subsample(fossGen, iter=50, q=0.3,
  tax="genus", bin="stg", type="sqs")

# plotting
tsplot(stages, shading="series", boxes="sys", xlim=51:95,
  ylab="corrected SIB richness", ylim=c(0,175))
lines(stages$mid[1:94], sqs0.6$divCSIB, col="blue")
lines(stages$mid[1:94], sqs0.3$divCSIB, col="green")
lines(stages$mid[1:94], dd$divCSIB, col="black")
legend("topleft", legend=c("raw", "SQS, q=0.6", "SQS, q=0.3"),
  col=c("black", "blue", "green"), lwd=c(2,2,2), bg="white")

## ----sqs2, echo=TRUE, results =FALSE, plot=TRUE, fig.height=5.5----------
sqsCollSing <-subsample(fossGen, iter=50, q=0.4, 
  tax="genus", bin="stg", type="sqs", 
  singleton="occ")
sqsRefSing <-subsample(fossGen, iter=50, q=0.4,
  tax="genus", bin="stg", type="sqs", ref="reference_no",
  singleton="ref")
sqsNoSing <-subsample(fossGen, iter=50, q=0.4,
  tax="genus", bin="stg", type="sqs", singleton=FALSE)

# plotting
tsplot(stages, shading="series", boxes="sys", xlim=51:95,
  ylab="corrected SIB richness", ylim=c(0,100))
lines(stages$mid[1:94], sqsRefSing$divCSIB, col="blue")
lines(stages$mid[1:94], sqsCollSing$divCSIB, col="black")
lines(stages$mid[1:94], sqsNoSing$divCSIB, col="red")
legend("topleft", legend=c("SQS, q=0.4", "SQS, q=0.4, ref", "SQS, q=0.4, occ"),
  col=c("black", "blue", "red"), lwd=c(2,2,2), bg="white")

## ----sqs3, echo=TRUE, results =FALSE, plot=TRUE, fig.height=5.5----------
sqsPure <-subsample(fossGen, iter=50, q=0.5,
  tax="genus", bin="stg", type="sqs")
sqsCorr <-subsample(fossGen, iter=50, q=0.5,
 tax="genus", bin="stg", ref="reference_no",coll="collection_no",
 type="sqs", singleton="ref", excludeDominant=T, largestColl=T)

# plotting
tsplot(stages, shading="series", boxes="sys", xlim=51:95,
  ylab="corrected SIB richness", ylim=c(0,100))
lines(stages$mid[1:94], sqsPure$divCSIB, col="blue")
lines(stages$mid[1:94], sqsCorr$divCSIB, col="black")
legend("topleft", legend=c("uncorrected SQS", 
  "corrected SQS"), col=c("blue", "black"), 
  lwd=c(2,2), bg="white")

## ----sqsColl, echo=TRUE, results =FALSE, plot=TRUE, fig.height=5.5-------
sqsByColl <-subsample(fossGen, iter=50, q=0.5,
 tax="genus", bin="stg", ref="reference_no",coll="collection_no",
 type="sqs", singleton="ref", excludeDominant=T, largestColl=T, byList=TRUE)

# plotting
tsplot(stages, shading="series", boxes="sys", xlim=51:95,
  ylab="corrected SIB richness", ylim=c(0,100))
lines(stages$mid[1:94], sqsByColl$divCSIB, col="blue")
lines(stages$mid[1:94], sqsCorr$divCSIB, col="black")
legend("topleft", legend=c("by-list SQS", 
  "by-occurrence SQS"), col=c("blue", "black"), 
  lwd=c(2,2), bg="white")

## ----bath, echo=TRUE, results =TRUE--------------------------------------
knownBath <- fossils[fossils$bath!="uk",]

## ----affMajor, echo=TRUE, results =TRUE----------------------------------
affMajor <- affinity(knownBath, bin="stg", tax="genus", 
  method="majority", env="bath")
table(affMajor)

## ----tabBath, echo=TRUE, results =TRUE-----------------------------------
table(knownBath$bath)

## ----affBin, echo=TRUE, results =TRUE, plot=TRUE, dev='png', dpi=300-----
affBin1 <- affinity(knownBath, bin="stg", tax="genus", 
  method="binom", env="bath")
table(affBin1)

## ----affBin2, echo=TRUE, results =TRUE-----------------------------------
affBin0.5 <- affinity(knownBath, bin="stg", tax="genus", 
  method="binom", env="bath", alpha=0.5)
table(affBin0.5)

affBin0.1 <- affinity(knownBath, bin="stg", tax="genus", 
  method="binom", env="bath", alpha=0.1)
table(affBin0.1)

## ----georan1, echo=TRUE, results =TRUE-----------------------------------
oneTax <- corals[corals$stg==94 & corals$genus=="Acropora",] 
georange(oneTax, lat="paleolat", lng="paleolng", method="co")

## ----georan2, echo=TRUE, results =TRUE-----------------------------------
collCount <- function(dat) length(unique(dat$coll))
allGeo <- tabinate(corals, bin="stg", tax="genus", FUN= collCount)

## ----georan3, echo=TRUE, results =TRUE-----------------------------------
allGeo <- tabinate(corals, bin="stg", tax="genus", 
  FUN=georange, lat="paleolat", lng="paleolng", method="co")

