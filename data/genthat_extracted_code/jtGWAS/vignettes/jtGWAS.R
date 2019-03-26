## ----setup1, include=FALSE-----------------------------------------------
require(knitr)

## ----setup2, include=FALSE----------------------------------------------------
options(width=80)  # make the printing fit on the page
set.seed(1121)     # make the results repeatable
stdt<-date()

## ----function mutiple threads, eval=FALSE-------------------------------------
#  res <- jtGWAS(X, G, outTopN=15, numThreads=1, standardized=TRUE)

## ----inputPara,size='tiny'----------------------------------------------------
num_patient	<- 100
num_marker 	<- 4
num_SNP 	<- 50

## ----markers_levels_geno_types,size='tiny'------------------------------------
set.seed(12345);
X_pat_mak <- matrix(rnorm(num_patient*num_marker),
                    num_patient,
                    num_marker)
G_pat_SNP <- matrix(rbinom(num_patient*num_SNP,2,0.5),
                    num_patient,
                    num_SNP)
colnames(X_pat_mak) <- colnames(X_pat_mak, do.NULL = FALSE, prefix = "Mrk:" )
colnames(G_pat_SNP) <- colnames(G_pat_SNP, do.NULL = FALSE, prefix = "SNP:" )

## ----loadpkg------------------------------------------------------------------
library(jtGWAS)

## ----exp3, results='hide'-----------------------------------------------------
JTStat <- jtGWAS(X_pat_mak, G_pat_SNP, outTopN=10)
summary(JTStat, marker2Print=1:4, SNP2Print=1:5)

## ----exp4, echo=FALSE, size='tiny'--------------------------------------------
summary(JTStat, marker2Print=1:4, SNP2Print=1:5)

## ----exp5, results='hide'-----------------------------------------------------
summary(JTStat, marker2Print=1:4, SNP2Print=1:5, printP=FALSE)

## ----exp6, echo=FALSE, size='tiny'--------------------------------------------
summary(JTStat, marker2Print=1:4, SNP2Print=1:5, printP=FALSE)

## ----exp7, results='hide'-----------------------------------------------------
JTAll <- jtGWAS(X_pat_mak, G_pat_SNP, outTopN=NA)
summary(JTAll, marker2Print=1:4, SNP2Print=1:3)
summary(JTAll, marker2Print=1:4, outTopN=3)

## ----exp8, echo=FALSE, size='tiny'--------------------------------------------
summary(JTAll, marker2Print=1:4, SNP2Print=1:3)
summary(JTAll, marker2Print=1:4, outTopN=3)

## ----sessinfo, echo=FALSE, include=TRUE, results='asis'-----------------------
toLatex(sessionInfo(), locale=FALSE)

## ----times, echo=FALSE, include=TRUE------------------------------------------
print(paste("Start Time",stdt))
print(paste("End Time  ",date()))

