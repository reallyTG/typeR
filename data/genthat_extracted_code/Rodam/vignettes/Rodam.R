## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, warning=FALSE, fig.align=TRUE)

## ----init0, eval=TRUE, include=TRUE--------------------------------------
library(Rodam)

## ----init-object, echo=TRUE----------------------------------------------
dh <- new('odamws', wsURL='https://pmb-bordeaux.fr/getdata/', dsname='frim1')

## ----getdatatree, echo=TRUE-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
options(width=256)
options(warn=-1)
options(stringsAsFactors=FALSE)

show(dh)

## ----getdata1, echo=TRUE--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
dh$getWSEntryByName("samples")

## ----getdata2, echo=TRUE--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
data <- dh$getDataByName('samples','sample/365')
data

## ----getdata3, echo=TRUE--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
data <- dh$getDataByName('samples') 
data[data$SampleID==365, ]

## ----getdata4, echo=TRUE--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
data$HarvestDate <- dh$dateToStr(data$HarvestDate)
data$HarvestHour <- dh$timeToStr(data$HarvestHour)
data[data$SampleID==365, ]

## ----getdata5, echo=TRUE--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ds <- dh$getSubsetByName('activome')
ds$samples   # Show the identifier defined in the data subset
ds$facnames  # Show all factors defined in the data subset

## ----hide1, include=FALSE---------------------------------------------------------------------------------------------------------------------------
options(width=150)

## ----getdata6, echo=TRUE----------------------------------------------------------------------------------------------------------------------------
ds$varnames  # Show all quantitative variables defined in the data subset
ds$qualnames # Show all qualitative variables defined in the data subset
ds$WSEntry   # Show all WS entries defined in the data subset

## ----plot1, echo=TRUE, fig.align='center', fig.width=12, fig.height=12------------------------------------------------------------------------------
Rank <- simplify2array(lapply(ds$varnames, function(x) { round(mean(log10(ds$data[ , x]), na.rm=T)) }))
cols <- c('red', 'orange', 'darkgreen', 'blue', 'purple')
boxplot(log10(ds$data[, ds$varnames]), outline=F, horizontal=T, border=cols[Rank], las=2, cex.axis=0.8)

## ----plot3, echo=TRUE-------------------------------------------------------------------------------------------------------------------------------
 refID <- "SampleID"
 subsetList <- c( "samples", "activome", "qNMR_metabo", "cellwall_metabo" )
 n <- length(subsetList)
 Mintersubsets <- matrix(data=0, nrow=n, ncol=n)
 for (i in 1:(n-1))
     for (j in (i+1):n)
          Mintersubsets[i,j] <- length(dh$getCommonID(refID,subsetList[i],subsetList[j]))
 
 rownames(Mintersubsets) <- subsetList
 colnames(Mintersubsets) <- subsetList
 Mintersubsets[ -n, -1 ]

## ----getdata7, echo=TRUE----------------------------------------------------------------------------------------------------------------------------
setNameList <- c("activome", "qNMR_metabo" )
dsMerged <- dh$getSubsetByName(setNameList)

## ----plot4, echo=TRUE, fig.align='center', fig.width=12, fig.height=18------------------------------------------------------------------------------
cols <- c( rep('red', length(dsMerged$varsBySubset[[setNameList[1]]])), 
           rep('darkgreen', length(dsMerged$varsBySubset[[setNameList[2]]])) )
boxplot(log10(dsMerged$data[, dsMerged$varnames]), outline=F, horizontal=T, border=cols, las=2, cex.axis=0.8)

## ----sessinfo, echo=TRUE------------------------------------------------------------------------------------------------------
options(width=128)
sessionInfo()

