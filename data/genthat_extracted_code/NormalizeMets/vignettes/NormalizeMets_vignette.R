## ----warning=F, cache=TRUE, message=FALSE--------------------------------
library(NormalizeMets)

## ----warning=F, cache=TRUE, message=FALSE--------------------------------
citation("NormalizeMets")

## ----warning=F, cache=TRUE, message=FALSE--------------------------------
data("alldata_eg")
featuredata_eg<-alldata_eg$featuredata
dataview(featuredata_eg)

## ----warning=F, cache=TRUE, message=FALSE--------------------------------
sampledata_eg<-alldata_eg$sampledata
dataview(sampledata_eg)

## ----warning=F, cache=TRUE, message=FALSE--------------------------------
metabolitedata_eg<-alldata_eg$metabolitedata
dataview(metabolitedata_eg)

## ----warning=F, cache=TRUE, message=FALSE--------------------------------
alldata_eg<-list(featuredata=featuredata_eg, sampledata=sampledata_eg,         metabolitedata=metabolitedata_eg)
dataview(alldata_eg$metabolitedata)

## ----eval=FALSE----------------------------------------------------------
#  LogTransform <- function(featuredata, base=exp(1), saveoutput=FALSE,
#      outputname="log.results",zerotona=FALSE)

## ----warning=F, cache=TRUE, message=FALSE--------------------------------
logdata <- LogTransform(featuredata_eg,zerotona=TRUE)
#logdata
#dataview(logdata$featuredata)

## ----eval=FALSE----------------------------------------------------------
#  MissingValues(featuredata, sampledata, as.dataframe(metabolitedata), feature.cutoff = 0.8,
#    sample.cutoff = 0.8, method = c("knn", "replace"), k = 10,
#    featuremax.knn = 0.8, samplemax.knn = 0.8, seed = 100,
#    saveoutput = FALSE, outputname = "missing.values.rep")

## ----warning=F, cache=TRUE, message=FALSE--------------------------------
imp <-  MissingValues(logdata$featuredata,sampledata_eg,metabolitedata_eg,
                      feature.cutof=0.8, sample.cutoff=0.8, method="knn")
#imp
#dataview(imp$featuredata)

## ----eval=FALSE----------------------------------------------------------
#  RlaPlots <- function(featuredata, groupdata, minoutlier = 0.5, type=c("ag", "wg"), saveplot=FALSE,
#                       plotname = "RLAPlot", savetype= c("png","bmp","jpeg", "tiff","pdf"),
#                       interactiveplot=TRUE, interactiveonly = TRUE,
#                       saveinteractiveplot = FALSE,
#                       interactivesavename = "interactiveRlaPlot",
#                       cols=NULL,cex.axis=0.8, las=2, ylim=c(-2, 2), oma=c(7, 4, 4, 2) + 0.1, ...)

## ----fig.width = 7,fig.height=4------------------------------------------
RlaPlots(imp$featuredata, sampledata_eg[,1], cex.axis = 0.6,saveinteractiveplot = TRUE)


## ----fig.width = 7,fig.height=4------------------------------------------
RlaPlots(t(imp$featuredata), groupdata=rep("group",dim(imp$featuredata)[2]),
         cex.axis = 0.6,saveinteractiveplot = TRUE,xlabel="Metabolites")

## ----eval=FALSE----------------------------------------------------------
#  PcaPlots <- function(featuredata, groupdata, saveplot=FALSE,saveinteractiveplot = FALSE,
#                       plotname="",savetype= c("png","bmp","jpeg","tiff","pdf"),
#                       interactiveplots = TRUE, y.axis=1, x.axis=2, center=TRUE, scale=TRUE,
#                       main=NULL, varplot=FALSE, multiplot=FALSE, n=3, cols=NULL,cex_val = 0.7, ...)

## ----eval=FALSE----------------------------------------------------------
#  PcaPlots(imp$featuredata,sampledata_eg[,1],
#           scale=FALSE, center=TRUE, multiplot = TRUE, varplot = TRUE)

## ----eval=FALSE----------------------------------------------------------
#  NormQcmets <- function(featuredata, factors = NULL, method = c("is", "nomis", "ccmn",
#    "ruv2", "ruvrand", "ruvrandclust"), isvec = NULL, ncomp = NULL,
#    k = NULL, plotk = FALSE, lambda = NULL, qcmets = NULL,
#    maxIter = 200, nUpdate = 100, lambdaUpdate = TRUE, p = 2,
#    saveoutput = FALSE, outputname = NULL,...)

## ----warning=F, cache=TRUE, message=FALSE--------------------------------
##'nomis' method
Norm_nomis <-NormQcmets(imp$featuredata, method = "nomis", 
                        qcmets = which(metabolitedata_eg$IS ==1))
#Norm_nomis
#Norm_nomis$featuredata

##'ccmn' method
Norm_ccmn <-NormQcmets(imp$featuredata, method = "ccmn", 
                       qcmets = which(metabolitedata_eg$IS ==1),
                       factors=sampledata_eg$gender)
#Norm_ccmn
#Norm_ccmn$featuredata

##`median' method
Norm_med <- NormScaling(imp$featuredata, method = "median")
#Norm_med
#Norm_med$featuredata

##`ruv2' method
factormat<-model.matrix(~gender +Age +bmi, sampledata_eg)
#head(factormat)
Norm_ruv2<-NormQcmets(imp$featuredata, factormat=factormat,method = "ruv2", 
                      k=2, qcmets = which(metabolitedata_eg$IS ==1))
#Norm_ruv2

##`is' method
Norm_is <-NormQcmets(imp$featuredata, method = "is", 
                       isvec = imp$featuredata[,which(metabolitedata_eg$IS ==1)[1]])
#Norm_is
#Norm_is$featuredata

## ----eval=FALSE----------------------------------------------------------
#  NormQcsamples<- function(featuredata, sampledata, method = c("rlsc"), span = 0,
#    deg = 2, lg = TRUE, saveoutput = FALSE,
#    outputname = "qcsample_results", ...)

## ----fig.width = 5, fig.height=5-----------------------------------------
 data(Didata)
 dataview(Didata$sampledata)

## ----fig.width = 5, fig.height=5-----------------------------------------
#Not run here due to lengthy output
#Norm_rlsc<- NormQcsamples(sampledata=Didata$sampledata[order(Didata$sampledata$order),],
#               featuredata=Didata$featuredata[order(Didata$sampledata$order),])
#Norm_rlsc

## ----eval=FALSE----------------------------------------------------------
#  NormScaling<-function(featuredata, method = c("median", "mean", "sum", "ref"),
#    refvec = NULL, saveoutput = FALSE, outputname = NULL, ...)

## ----eval=TRUE-----------------------------------------------------------
 Norm_med <- NormScaling(imp$featuredata, method = "median")
 Norm_med

## ----eval=FALSE----------------------------------------------------------
#  NormCombined<-function(featuredata, methods = c("rlsc", "median"),
#    savefinaloutput = FALSE, finaloutputname = NULL, ...)

## ----fig.width = 5, fig.height=5-----------------------------------------
#Not run due to lenghty output
#Norm_comb<- NormCombined(featuredata=Didata$featuredata[order(Didata$sampledata$order),],
#                          sampledata=Didata$sampledata[order(Didata$sampledata$order),],
#                          methods=c("rlsc","median"))
#Norm_comb

## ----warning=F, cache=TRUE, message=FALSE--------------------------------
unadjustedFit<-LinearModelFit(featuredata=imp$featuredata,
                              factormat=factormat,
                              ruv2=FALSE)
#unadjustedFit
isFit<-LinearModelFit(featuredata=Norm_is$featuredata,
                       factormat=factormat,
                       ruv2=FALSE)
#isFit
ruv2Fit<-LinearModelFit(featuredata=imp$featuredata,
                        factormat=factormat,
                        ruv2=TRUE,k=2,
                        qcmets = which(metabolitedata_eg$IS ==1))
#ruv2Fit

## ----fig.width = 10, fig.height=8----------------------------------------
#Exploring metabolites associated with age
lcoef_age<-list(unadjusted=unadjustedFit$coefficients[,"Age"],
                is_age=isFit$coefficients[,"Age"],
                ruv2_age=ruv2Fit$coefficients[,"Age"])
lpvals_age<-list(unadjusted=unadjustedFit$p.value[,"Age"],
                 is=isFit$p.value[,"Age"],
                 ruv2=ruv2Fit$p.value[,"Age"])

negcontrols<-metabolitedata_eg$names[which(metabolitedata_eg$IS==1)]                   

CompareVolcanoPlots(lcoef=lcoef_age, 
                    lpvals_age, 
                    normmeth = c(":unadjusted", ":is", ":ruv2"),
                    xlab="Coef",
                    negcontrol=negcontrols)

## ----fig.width = 10, fig.height=8----------------------------------------
#Exploring metabolites associated with BMI
lcoef_bmi<-list(unadjusted=unadjustedFit$coefficients[,"bmi"],
                   is=isFit$coefficients[,"bmi"],
                   ruv2=ruv2Fit$coefficients[,"bmi"])

lpvals_bmi<-list(unadjusted=unadjustedFit$p.value[,"bmi"],
                    is=isFit$p.value[,"bmi"],
                    ruv2=ruv2Fit$p.value[,"bmi"])

CompareVolcanoPlots(lcoef=lcoef_bmi, 
                    lpvals_bmi, 
                    normmeth = c(":unadjusted", ":is", ":ruv2"),
                    xlab="Coef",
                    negcontrol=negcontrols)

## ----fig.width = 10, fig.height=8----------------------------------------
#Exploring metabolites associated with gender
lcoef_gender<-list(unadjusted=unadjustedFit$coefficients[,"gendercode_1"],
                is_age=isFit$coefficients[,"gendercode_1"],
                ruv2_age=ruv2Fit$coefficients[,"gendercode_1"])
lpvals_gender<-list(unadjusted=unadjustedFit$p.value[,"gendercode_1"],
                 is=isFit$p.value[,"gendercode_1"],
                 ruv2=ruv2Fit$p.value[,"gendercode_1"])
poscontrols_gender<-metabolitedata_eg$names[which(metabolitedata_eg$pos_controls_gender==1)]                   
CompareVolcanoPlots(lcoef=lcoef_gender, 
                    lpvals_gender, 
                    normmeth = c(":unadjusted", ":is", ":ruv2"),
                    negcontrol=negcontrols, 
                    poscontrol=poscontrols_gender)

## ----fig.width = 8, fig.height=5-----------------------------------------
lresiddata<-list(unadjusted=unadjustedFit$residuals,
                 is=isFit$residuals,
                 ruv2=ruv2Fit$residuals)
CompareRlaPlots(lresiddata,groupdata=sampledata_eg$batch,
                yrange=c(-3,3),
               normmeth = c("unadjusted:","is:","ruv2:"))

## ----fig.width = 8, fig.height=5-----------------------------------------
  ComparePvalHist(lpvals = lpvals_age,ylim=c(0,40),
  normmeth = c("unadjusted","is","ruv2"))

## ----fig.width = 5, fig.height=5-----------------------------------------
  lnames<- list(names(ruv2Fit$coef[,"Age"])[which(ruv2Fit$p.value[,"Age"]<0.05)],
                names(unadjustedFit$coef[,"Age"])[which(unadjustedFit$p.value[,"Age"]<0.05)],
                names(isFit$coef[,"Age"])[which(isFit$p.value[,"Age"]<0.05)])
  
  VennPlot(lnames, group.labels=c("ruv2","unadjusted","is"))

## ----warning=F, cache=TRUE, message=FALSE--------------------------------
data(UVdata)
dataview(UVdata$featuredata)
dataview(UVdata$sampledata)
dataview(UVdata$metabolitedata)

#Not RUN due to user input; we set k=1 each and saved normalized data as uv_ruvrandclust
#uv_ruvrand_norm<-NormQcmets(featuredata=UVdata$featuredata,
#                            method="ruvrandclust",
#                            qcmets=which(UVdata$metabolitedata$neg_control==1),
#                            k=1)

data("uv_ruvrandclust")
dataview(uv_ruvrandclust$featuredata)


## ----warning=F, cache=TRUE, message=FALSE--------------------------------
#INCLUDE A PAIRS COMPAREPCA PLOT HERE 

## ----fig.width = 8, fig.height=5-----------------------------------------
 lfeaturedata<-list(unadj=UVdata$featuredata,ruv=uv_ruvrandclust$featuredata,
                    ruvuv=uv_ruvrandclust$uvdata)
 CompareRlaPlots(lfeaturedata,
                 groupdata=interaction(UVdata$sampledata$temperature,UVdata$sampledata$instrument),
                 normmeth=c("Unadjusted:", "RUVrandclust normalized:", 
                            "RUVrandclust: removed uv:"),
                 yrange=c(-3,3))

## ----fig.width = 5, fig.height=5-----------------------------------------
 hca<-Dendrogram(featuredata=uv_ruvrandclust$featuredata,
                 groupdata=UVdata$sampledata$group, 
                 clust=TRUE, 
                 nclust=2)
 
 HeatMap(uv_ruvrandclust$featuredata,
          UVdata$sampledata$group,interactiveplot = TRUE, 
          colramp=c(75, "magenta", "green"),
          distmethod = "manhattan", aggmethod = "ward.D")


## ----fig.width = 5, fig.height=5-----------------------------------------
  svm<-SvmFit(featuredata=uv_ruvrandclust$featuredata, 
              groupdata=UVdata$sampledata$group,
              crossvalid=TRUE,
              k=5,
              rocplot = TRUE)

## ----fig.width = 5, fig.height=10----------------------------------------
lcor<-list(Corr(UVdata$featuredata)$results[,3],
  Corr(uv_ruvrandclust$featuredata)$results[,3])
ComparePvalHist(lcor,normmeth = c("unadjusted","ruvrandclust"),
                xlim=c(-1,1), xlab="Correlation coefficients",ylim=c(0,120)) 

lcor_p<-list(Corr(UVdata$featuredata)$results[,4],
  Corr(uv_ruvrandclust$featuredata)$results[,4])
ComparePvalHist(lcor_p,normmeth = c("unadjusted","ruvrandclust"),
                xlim=c(0,1),ylim=c(0,200)) 


