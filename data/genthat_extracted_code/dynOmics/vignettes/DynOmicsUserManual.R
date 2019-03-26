## ----global_options, include=FALSE---------------------------------------
library(knitr)
knitr::opts_chunk$set(dpi = 100, echo=TRUE, warning=FALSE, message=FALSE, 
                      fig.show=TRUE, fig.keep = 'all')
  options(mc.cores=2)

## ----include=T,eval=F----------------------------------------------------
#  citation('dynOmics')

## ----include=T,eval=F----------------------------------------------------
#  #install from CRAN
#  install.packages('dynOmics')

## ----include=T,eval=F----------------------------------------------------
#  #install from bitbucket
#  install.packages('devtools')
#  library(devtools)
#  install_bitbucket('Jasmin87/dynOmics')

## ----include=T,eval=F----------------------------------------------------
#  install.packages('httr')
#  library(httr)
#  #Replace the information in "" with your according proxy information
#  set_config(use_proxy(url="http://proxyname.company.com",
#                       port=8080,username="XXX",password="XXX"))
#  

## ----eval=T, warning=FALSE,message=FALSE---------------------------------
library(dynOmics)
?dynOmics

## ----transcript----------------------------------------------------------
kable(head(Transcripts[,1:4],7),format = "html",caption ="Example time course data for a transcriptomics data set, where we assume there is one sample measured per time point.",row.names = T)


## ---- include=T----------------------------------------------------------
# Data description and references
?Metabolites
?Transcripts
# load data into workspace
data(Metabolites)
data(Transcripts)
# extract of the Metabolite data set
head(Metabolites)

## ------------------------------------------------------------------------
#identify associations between the Metabolites and Transcripts data sets

asso <- associateData(Metabolites,Transcripts,numCores = 2)

## ------------------------------------------------------------------------
kable(head(asso))

## ----include=T-----------------------------------------------------------
summary(asso)

## ----include=T-----------------------------------------------------------
plot(asso, Metabolites,Transcripts, feature1 = 2, fdr=FALSE, cutoff = 0.9)

## ----include=T-----------------------------------------------------------
# and aligns / corrects Transcripts according to dynOmics estimated delay
plot(asso, Metabolites, Transcripts, feature1 = 2, withShift=TRUE, fdr=FALSE, cutoff = 0.9)

## ----include=T,warning=F,message=F---------------------------------------
#from the lmmSpline example
#install.packages('lmms') if required
if(!require(lmms)){install.packages("lmms")}
library('lmms')
#load example data
data(kidneySimTimeGroup)

#Only extract samples from Group 1
G1 <- which(kidneySimTimeGroup$group=="G1")

## ------------------------------------------------------------------------
unique(kidneySimTimeGroup$time[G1])

## ------------------------------------------------------------------------
# for the first 6 unique individuals
table(kidneySimTimeGroup$time[G1],sampleID=kidneySimTimeGroup$sampleID[G1])[,1:6]

## ------------------------------------------------------------------------
# expression data from samples from group 1
data.kidney <- kidneySimTimeGroup$data[G1,]
dim(data.kidney)

time <- kidneySimTimeGroup$time[G1]

sampleID.kidney <- kidneySimTimeGroup$sampleID[G1]

## ------------------------------------------------------------------------
#Model data using a data-driven mixed effect spline model
LMMS.model <- lmmSpline(data= data.kidney,
                          time=time,
                          sampleID=sampleID.kidney,
                          keepModels = TRUE)

## ------------------------------------------------------------------------
time.regular <- seq(min(time), max(time), by=0.5)
time.regular

## ------------------------------------------------------------------------
# need to transpose interpolated data
data.interpolate <- t(predict(LMMS.model, timePredict = time.regular))

## ------------------------------------------------------------------------
dim(data.interpolate)

## ------------------------------------------------------------------------
asso.onedata  <- associateData(data.interpolate,numCores = 2)
kable(head(asso.onedata))

## ------------------------------------------------------------------------
# define reference of interest
reference <-data.interpolate[,1]
data.query <- data.interpolate[, -1]
asso.ref.onedata  <- associateData(data1 = reference, data2 =  data.query,numCores = 2)
kable(head(asso.ref.onedata))

