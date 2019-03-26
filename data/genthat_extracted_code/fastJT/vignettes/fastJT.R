## ----setup1, include=FALSE-----------------------------------------------
require(knitr)

## ----setup2, include=FALSE----------------------------------------------------
options(width=80)  # make the printing fit on the page
set.seed(1121)     # make the results repeatable
stdt<-date()

## ----fastJT, eval=FALSE-------------------------------------------------------
#  res <- fastJT(Y, X, outTopN=15, numThreads=1, standardized=TRUE)

## ----fastJTselect, eval=FALSE-------------------------------------------------
#  res <- fastJT.select(Y, X, cvMesh=NULL, kFold=10L,
#                       selCrit=NULL, outTopN=15L, numThreads=1L)

## ----inputPara----------------------------------------------------------------
num_sample	<- 100
num_marker 	<- 4
num_feature 	<- 50

## ----markers_levels_geno_types------------------------------------------------
set.seed(12345);
Data    <- matrix(rnorm(num_sample*num_marker), 
                  num_sample, num_marker)
Feature <- matrix(rbinom(num_sample*num_feature,2,0.5),
                  num_sample, num_feature)
colnames(Data)    <- paste0("Mrk:",1:num_marker)
colnames(Feature) <- paste0("Ftr:",1:num_feature)

## ----loadpkg------------------------------------------------------------------
library(fastJT)

## ----exp3, results='hide'-----------------------------------------------------
JTStat <- fastJT(Y=Data, X=Feature, outTopN=10)
summary(JTStat, Y2Print=1:4, X2Print=1:5)

## ----exp4, echo=FALSE, size='tiny'--------------------------------------------
summary(JTStat, Y2Print=1:4, X2Print=1:5)

## ----exp5, eval=FALSE---------------------------------------------------------
#  summary(JTStat, Y2Print=1:4, X2Print=1:5, printP=FALSE)

## ----exp6, echo=FALSE, size='tiny'--------------------------------------------
summary(JTStat, Y2Print=1:4, X2Print=1:5, printP=FALSE)

## ----exp7, results='hide'-----------------------------------------------------
JTAll <- fastJT(Y=Data, X=Feature, outTopN=NA)
summary(JTAll, Y2Print=1:4, outTopN=3)

## ----exp8, echo=FALSE, size='tiny'--------------------------------------------
summary(JTAll, Y2Print=1:4, outTopN=3)

## ----select1, eval=FALSE------------------------------------------------------
#  fastJT.select(Y=Data, X=Feature, cvMesh=NULL, kFold=5,
#                selCrit=NULL, outTopN=5, numThreads=1)

## ----select1out, echo=FALSE, size='tiny'--------------------------------------
fastJT.select(Y=Data, X=Feature, cvMesh=NULL, kFold=5,
              selCrit=NULL, outTopN=5, numThreads=1)

## ----cvMesh, results='hide'---------------------------------------------------
Mesh <- function(rownamesData, kFold){
  numSamples <- length(rownamesData)
  res <- NULL
  subSampleSize <- floor(numSamples/kFold)
  for (i in 1:kFold){
    start <- (i-1)*subSampleSize + 1
    if(i < kFold)
      end <- i*subSampleSize
    else
      end <- numSamples
    if(i == 1)
      res <- list(c(start:end))
    else
      res[[i]] <- c(start:end)
  }
  res
}

## ----selCrit, results='hide'--------------------------------------------------
whichpart <- function(x, n=30) {
  nx <- length(x)
  p <- nx-n
  xp <- sort(x, partial=p)[p]
  which(x > xp)
}

selectCrit <- function(J, P){
  pcut <- 0.95
  hit <- NULL
  for(i in 1:ncol(P)){
    if(i == 1)
      hit <- list(rownames(P)[whichpart(P[,i], 4)])
    else
      hit[[i]] = rownames(P)[whichpart(P[,i], 4)]
  }
  res <- do.call(cbind, hit)
  colnames(res) <- colnames(P)
  res
}

## ----select2, eval=FALSE------------------------------------------------------
#  fastJT.select(Data, Feature, cvMesh=Mesh, kFold=5,
#                selCrit=selectCrit, outTopN=5, numThreads=1)

## ----select2out, echo=FALSE, size='tiny'--------------------------------------
fastJT.select(Data, Feature, cvMesh=Mesh, kFold=5,
              selCrit=selectCrit, outTopN=5, numThreads=1)

## ----sessinfo, echo=FALSE, include=TRUE, results='asis'-----------------------
toLatex(sessionInfo(), locale=FALSE)

## ----times, echo=FALSE, include=TRUE------------------------------------------
print(paste("Start Time",stdt))
print(paste("End Time  ",date()))

