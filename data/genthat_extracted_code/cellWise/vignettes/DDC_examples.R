## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
 fig.width= 5 ,
 fig.height = 3.5,
 fig.align='center'
)

## ------------------------------------------------------------------------
library("cellWise")

# Default options for DetectDeviatingCells:
DDCpars = list(fracNA = 0.5,numDiscrete = 3,precScale = 1e-12,
             tolProb = 0.99, corrlim = 0.5, combinRule = "wmean",
             includeSelf = TRUE, rowdetect = TRUE, returnBigXimp = F,
             fastDDC = FALSE)
fastDDCpars = list(fracNA = 0.5,numDiscrete = 3,precScale = 1e-12,
             tolProb = 0.99, corrlim = 0.5, combinRule = "wmean",
             includeSelf = TRUE, rowdetect = TRUE, returnBigXimp = F,
             fastDDC = TRUE)


## ------------------------------------------------------------------------
set.seed(12345) # reproducible
n = 100; d = 10
A = matrix(0.9, d, d); diag(A) = 1
A # true covariance matrix
library(MASS) # only needed for the function mvrnorm in the next line:
xclean = mvrnorm(n, rep(0,d), A)
round(xclean[1:3,1:5],2)

DDCxclean = DetectDeviatingCells(xclean,DDCpars)
# TRUE # OK, all parts of the output match

summary(DDCxclean)
round(DDCxclean$Z[1:12,],2)# robustly standardized data:
# Due to the high correlations, cells in the same row look similar


DDCxclean$k 
# The code looked for up to 9 non-self neighbors of each variable.
# (It goes through all of them, unless d is huge.)


DDCxclean$ngbrs # show the neighbors:
# i.e. the nearest non-self neighbor of X10 is X4, then X1,...

round(DDCxclean$robcors,2) # correlations with these neighbors:
# Per row, the correlation are sorted by decreasing absolute value.

round(DDCxclean$robslopes,2) # slope of each neighbor predicting the column:
# For instance, X10 is predicted by its first neighbor with slope 0.94
# and by its second neighbor with slope 0.90 .

round(DDCxclean$Xest[1:12,],2) # the estimated cells:

round(DDCxclean$stdResid[1:12,],1) # the standardized residuals:


DDCxclean$indcells # indices of the cells that were flagged:
d

# The standardized residuals of the flagged cells:
round(DDCxclean$stdResid[DDCxclean$indcells],1)
# They are just barely larger in absolute value than 
# sqrt(qchisq(0.99,1)) = 2.576 and there are not many,
# given that there are 1000 cells here.


# the standardized residuals are roughly standard gaussian:
qqnorm(as.vector(DDCxclean$stdResid)) 
# is a straight line through 0 with slope about 1.
# So, nothing stands out in this clean dataset.

# outlyingness of the rows:
qqnorm(DDCxclean$Ti) # looks fairly gaussian too

DDCxclean$indrows # no rows are flagged:

DDCxclean$indall # flagged cells including those in flagged rows:


round(DDCxclean$Ximp[1:12,],2) # the imputed matrix:


round((DDCxclean$Ximp - xclean)[1:12,],2)
# Only a few cells were imputed in this example.

## ----results='hide',message=FALSE,warning=FALSE--------------------------
 library(robustHD)
 data(TopGear)

## ----fig.height=10,fig.width=10------------------------------------------
dim(TopGear)
rownames(TopGear)[1:13] # "1" to "297" are not useful names
rownames(TopGear) = paste(TopGear[,1],TopGear[,2]) 
# Now the rownames are make and model of the cars.
rownames(TopGear)[165] = "Mercedes-Benz G" # name was too long
myTopGear = TopGear[,-31] # removes the subjective variable `Verdict'

# Transform some variables to get roughly gaussianity in the center:
transTG = myTopGear
transTG$Price = log(myTopGear$Price)
transTG$Displacement = log(myTopGear$Displacement)
transTG$BHP = log(myTopGear$BHP)
transTG$Torque = log(myTopGear$Torque)
transTG$TopSpeed = log(myTopGear$TopSpeed)


# Run the method:
DDCtransTG = DetectDeviatingCells(transTG,DDCpars)

# the remaining part of the dataset:
remX = DDCtransTG$remX 
dim(remX)


colSums(is.na(remX))

# We have NAs left, mainly in `Weight'.

n = nrow(remX)
d = ncol(remX)
indexDDCcells = matrix(FALSE,nrow=n,ncol=d) 
indexDDCcells[DDCtransTG$indcells] = TRUE
dim(indexDDCcells)

# Analyze the data by column:
standX = scale(remX,apply(remX,2,median,na.rm = TRUE), 
               apply(remX,2,mad,na.rm = TRUE))
dim(standX)
round(standX[1:5,],1) # has NAs where remX does
transTGcol = remX
transTGcol[abs(standX) > sqrt(qchisq(0.99,1))] = NA
round(transTGcol[1:5,],1) # also has NAs in outlying cells

# Make untransformed submatrix of X for labeling the cells in the plot:
tempX = myTopGear[DDCtransTG$rowInAnalysis,DDCtransTG$colInAnalysis]
dim(tempX)
tempX$Price = tempX$Price/1000 # to avoid printing long numbers

xlabels = colnames(tempX)
ylabels = rownames(tempX)
# select the following cars for the cellmap:
yshowindex = c(12,42,56,73,81,94,99,135,150,164,176,198,209,215,234,241,277)
# make two ggplot2 objects:

ggpcol = cellMap(D=tempX,
                 R=standX,
                 indcells=which(is.na(transTGcol)),
                 indrows=integer(0),
                 xlabels=xlabels,
                 ylabels=ylabels,
                 mTitle="By column",
                 yshowindex=yshowindex,
                 showVals="D",
                 hjustYlabels=0.5) 
plot(ggpcol)

ggpDDC = cellMap(D=tempX,
                 R=DDCtransTG$stdResid, 
                 indcells=which(indexDDCcells==TRUE),
                 indrows=DDCtransTG$indrows,
                 xlabels=xlabels,
                 ylabels=ylabels,
                 mTitle="DetectDeviatingCells",
                 yshowindex=yshowindex,
                 showVals="D",
                 hjustYlabels=0.5)
plot(ggpDDC)

# Creating the pdf:
pdfName = "cellmap_TopGear.pdf"
pdf(pdfName, width = 20, height = 15 )
gridExtra::grid.arrange(ggpcol,ggpDDC,nrow=1) # arranges ggplot2,.. on a page
dev.off()


## ------------------------------------------------------------------------
data(philips)
dim(philips) 
colnames(philips) = c("X1","X2","X3","X4","X5","X6","X7","X8","X9")

## ----results='hide',message=FALSE,warning=FALSE--------------------------
library(robustbase) # for covMcd

## ------------------------------------------------------------------------
MCDphilips = covMcd(philips)
pdfName = "figure_philips_left.pdf"
pdf(pdfName, width = 10, height = 4)
plot(sqrt(mahalanobis(philips,MCDphilips$center,MCDphilips$cov)),
     main="Philips data",ylab="Robust distances",xlab="",pch=20)
abline(h=sqrt(qchisq(0.975,df=9)))
dev.off()

## ------------------------------------------------------------------------
DDCphilips = DetectDeviatingCells(philips,DDCpars)

summary(DDCphilips)

qqnorm(as.vector(DDCphilips$Z)) 
# rather gaussian, here we only see 2 outliers

round(DDCphilips$stdResid[1:12,],1) # the standardized residuals:

DDCphilips$indcells # indices of the cells that were flagged:

DDCphilips$indrows # flagged rows:

## ----fig.height=10,fig.width=10------------------------------------------
# cellmaps with rectangular blocks:

xblocksize = 1
yblocksize = 15 # 20
xlabels = colnames(philips)
ylabels = 1:dim(philips)[1] #rownames(philips)
n = nrow(philips)
d = ncol(philips)

indrows=which(mahalanobis(philips,MCDphilips$center,MCDphilips$cov) >
                qchisq(0.975,df=d))

ggpMCDphilips = cellMap(D=philips,R=matrix(0,n,d),
                        indcells=integer(0),
                        indrows=indrows,
                        xlabels=xlabels,
                        ylabels=ylabels,
                        mTitle="MCD",
                        xblocksize=xblocksize,
                        yblocksize=yblocksize,
                        autolabel=T)
plot(ggpMCDphilips)

ggpDDCphilips = cellMap(D=philips, R=DDCphilips$stdResid,
                        indcells=DDCphilips$indcells,
                        indrows=integer(0), #DDCphilips$indrows,
                        xlabels=xlabels,
                        ylabels=ylabels,
                        mTitle="DetectDeviatingCells",
                        xblocksize=xblocksize,
                        yblocksize=yblocksize,
                        autolabel=T,
                        hjustYlabels=1)
plot(ggpDDCphilips)

pdfName = "figure_philips_right.pdf"
pdf(pdfName, width = 6, height = 12)
plot(ggpDDCphilips) 
dev.off()

## ------------------------------------------------------------------------
data(mortality)
dim(mortality)
# 198  91
rownames(mortality) 
colnames(mortality) 

DDCmortality = DetectDeviatingCells(mortality,DDCpars) # 3 seconds


remX = DDCmortality$remX
dim(remX)

## ----results='hide',message=FALSE,warning=FALSE--------------------------
library(rrcov) # for robust PCA

## ----fig.height=10,fig.width=10------------------------------------------
PCAmortality = PcaHubert(mortality,alpha=0.75,scale=FALSE)

xblocksize = 5
yblocksize = 5
xlabels = colnames(remX) # the _columns_ are in the x-direction
ylabels = rownames(remX)
n = nrow(remX)
d = ncol(remX)

ggpROBPCA = cellMap(D=remX,R=matrix(0,n,d),
                           indcells=integer(0),
                           indrows=which(PCAmortality@flag==FALSE),
                           xlabels=xlabels,
                           ylabels=ylabels,
                           mTitle="By row",
                           xblocksize=xblocksize,
                           yblocksize=yblocksize,
                           autolabel=T)
plot(ggpROBPCA)

ggpDDC = cellMap(D=remX, R=DDCmortality$stdResid,
                        indcells=DDCmortality$indcells,
                        indrows=DDCmortality$indrows,
                        xlabels=xlabels,
                        ylabels=ylabels,
                        mTitle="DetectDeviatingCells",
                        xblocksize=xblocksize,
                        yblocksize=yblocksize,
                        autolabel=T)
plot(ggpDDC)

pdf(paste("cellmap_mortality_",xblocksize,".pdf",sep=""),width=14,height=12)
gridExtra::grid.arrange(ggpROBPCA,ggpDDC,nrow=1)
dev.off()

## ------------------------------------------------------------------------
data(glass)
DDCglass = DetectDeviatingCells(glass,DDCpars) # takes 1 or 2 minutes
remX = DDCglass$remX
dim(remX)
fastDDCglass = DetectDeviatingCells(glass, fastDDCpars)
remXfast = fastDDCglass$remX
dim(remX)

## ----results='hide',message=FALSE,warning=FALSE--------------------------
library(rrcov) # for robust PCA:

## ------------------------------------------------------------------------
PCAglass = PcaHubert(glass,alpha=0.75,scale=FALSE)

xblocksize = 5
yblocksize = 5
n = nrow(remX)
d = ncol(remX)
xlabels = rep("",floor(d/xblocksize));
xlabels[1] = "1";
xlabels[floor(d/xblocksize)] = "d"
xlabels
ylabels = rep("",floor(n/yblocksize));
ylabels[1] = "1"
ylabels[floor(n/yblocksize)] = "n";
ylabels
xtitle = "wavelengths"
ytitle = "glass samples"

ggpROBPCA = cellMap(D=remX, R=matrix(0,n,d),
                           indcells=integer(0),
                           indrows=which(PCAglass@flag==FALSE),
                           xlabels=xlabels,
                           ylabels=ylabels,
                           mTitle="By row",
                           xblocksize=xblocksize,
                           yblocksize=yblocksize,
                           anglex=0,
                           xtitle=xtitle,
                           ytitle=ytitle,
                           sizexy=1.5,
                           autolabel=F)
plot(ggpROBPCA)

ggpDDC = cellMap(D=remX, R=DDCglass$stdResid,
                        indcells=DDCglass$indcells,
                        indrows=integer(0), # DDCglass$indrows,
                        xlabels=xlabels,
                        ylabels=ylabels,
                        mTitle="DetectDeviatingCells",
                        xblocksize=xblocksize,
                        yblocksize=yblocksize,
                        anglex=0,
                        xtitle=xtitle,
                        ytitle=ytitle,
                        sizexy=1.5,
                        autolabel=F)
plot(ggpDDC)


ggpfastDDC = cellMap(D=remXfast, R=fastDDCglass$stdResid,
                        indcells=fastDDCglass$indcells,
                        indrows=integer(0), # DDCglass$indrows,
                        xlabels=xlabels,
                        ylabels=ylabels,
                        mTitle="fast DetectDeviatingCells",
                        xblocksize=xblocksize,
                        yblocksize=yblocksize,
                        anglex=0,
                        xtitle=xtitle,
                        ytitle=ytitle,
                        sizexy=1.5,
                        autolabel=F)
plot(ggpfastDDC)

pdf(paste("cellmap_glass2_",xblocksize,".pdf",sep=""),width=16,height=10)
gridExtra::grid.arrange(ggpROBPCA,ggpDDC,ncol=1)
dev.off()

## ------------------------------------------------------------------------

i = c(1,2,3,4,5,6,7,8,9) 
name = c("aa","bb","cc","dd","ee","ff","gg","hh","ii") 
logic = c(TRUE, FALSE, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE, FALSE) 
V1 = c(1.3,NaN,4.5,2.7,-3.3,4.4,-2.1,1.1,-5)
V2 = c(2.3,NA,5,6,7,8,4,3,0.5)
V3 = c(2,Inf,3,-4,5,6,7,-2,8)
Vna = c(1,-4,2,NaN,3,-Inf,NA,6,5)
Vdis = c(1,1,2,2,3,3,3,1,2)
V0s = c(1,1.5,2,2,2,2,2,3,2.5) 
datafr = data.frame(i,name,logic,V1,V2,V3,Vna,Vdis,V0s) 
datafr

DDCdatafr=DetectDeviatingCells(datafr,DDCpars)

DDCdatafr


