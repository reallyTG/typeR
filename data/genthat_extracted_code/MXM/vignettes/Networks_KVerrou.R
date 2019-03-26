## ---- warning =  FALSE, message = FALSE----------------------------------

### ~ ~ ~ Load Packages ~ ~ ~ ###
library(MXM) 
library(dplyr)


## ------------------------------------------------------------------------

### ~ ~ ~ Load The Dataset ~ ~ ~ ###
wine.url <- "ftp://ftp.ics.uci.edu/pub/machine-learning-databases/wine/wine.data"
wine <- read.csv(wine.url,
                 check.names = FALSE,
                 header = FALSE) 
head(wine)
str(wine)
colnames(wine) <- c('Type', 'Alcohol', 'Malic', 'Ash', 
                    'Alcalinity', 'Magnesium', 'Phenols', 
                    'Flavanoids', 'Nonflavanoids',
                    'Proanthocyanins', 'Color', 'Hue', 
                    'Dilution', 'Proline')

## ------------------------------------------------------------------------
### ~ ~ ~ Running MMHC skeleton with MMPC ~ ~ ~ ###
MmhcSkeleton <- MXM::mmhc.skel(dataset    = wine, 
                               max_k      = 3, 
                               threshold  = 0.05,
                               test       = NULL,
                               type       = "MMPC",
                               backward   = TRUE,
                               symmetry   = TRUE,
                               nc         = 1,
                               ini.pvalue = NULL,
                               hash       = TRUE)

## ------------------------------------------------------------------------
head(MmhcSkeleton$G)

## ------------------------------------------------------------------------
## MXM::plotnetwork(MmhcSkeleton$G, "MMHC with MMPC Network")

## ------------------------------------------------------------------------
MmhcSkeleton$info

## ------------------------------------------------------------------------
MmhcSkeleton$density

## ------------------------------------------------------------------------
head(MmhcSkeleton$pvalue)

## ------------------------------------------------------------------------
head(MmhcSkeleton$ini.pvalue)

## ------------------------------------------------------------------------
MmhcSkeleton$ntests

## ------------------------------------------------------------------------
MmhcSkeleton$runtime

## ------------------------------------------------------------------------
### ~ ~ ~ Running MMHC skeleton with MMPC ~ ~ ~ ###
MmhcLocalSkeleton <- MXM::local.mmhc.skel(dataset    = wine, 
                               node       = 1,
                               max_k      = 3, 
                               threshold  = 0.05,
                               test       = NULL)

## ------------------------------------------------------------------------
### ~ ~ ~ Running MMHC skeleton with MMPC ~ ~ ~ ###
PcSkeleton <- MXM::pc.skel(dataset    = wine, 
                               method      = "comb.fast" ,
                               alpha       = 0.01,
                               rob       = FALSE,
                               R   = 2)

## ------------------------------------------------------------------------
head(PcSkeleton$G)

## ------------------------------------------------------------------------
## MXM::plotnetwork(PcSkeleton$G, "PC Network")

## ------------------------------------------------------------------------
PcSkeleton$info

## ------------------------------------------------------------------------
PcSkeleton$density

## ------------------------------------------------------------------------
head(PcSkeleton$pvalue)

## ------------------------------------------------------------------------
head(PcSkeleton$ini.pvalue)

## ------------------------------------------------------------------------
PcSkeleton$runtime

## ------------------------------------------------------------------------
head(PcSkeleton$stat)

## ------------------------------------------------------------------------
PcSkeleton$kappa

## ------------------------------------------------------------------------
PcSkeleton$sepset[[1]][1:5,]

## ---- message==FALSE-----------------------------------------------------
### ~ ~ ~  Running FS skeleton  ~ ~ ~ ###
FSSkeleton <- MXM::corfs.network(x    = as.matrix(wine[,-1]), 
                               threshold  = 0.05,
                               symmetry = TRUE,
                               tolb       = 2,
                               tolr = 0.02,
                               stopping   = "BICR2",
                               nc         = 1)

## ------------------------------------------------------------------------
## MXM::plotnetwork(FSSkeleton$G, "Partial Correlation based on FS Network")

## ------------------------------------------------------------------------
sessionInfo()

