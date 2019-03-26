library(adespatial)


### Name: mspa
### Title: Multi-Scale Pattern Analysis
### Aliases: mspa print.mspa scatter.mspa
### Keywords: multivariate spatial

### ** Examples



####################################
### using oribatib mites dataset ###
####################################

if(require("ade4", quietly = TRUE)){
## load data
data(oribatid)

## get the list of spatial weights
cn <- chooseCN(oribatid$xy, res = "listw", ask = FALSE, type = 1)

## Hellinger transformation
hellTrans <- function(X){
  if (!( is.matrix(X) | is.data.frame(X) )) stop("Object is not a matrix.")  
  if (any(is.na(X))) stop("na entries in table.")
  
  sumRow <- apply(X,1,sum)
  Y <- X/sumRow
  Y <- sqrt(Y)
  
  return(Y)
}


## ENVIRONMENTAL VARIABLES ##
## Hill and Smith analysis for environmental variables
## (for a mixture of quantitative / qualitative variables)
hsEnv <- dudi.hillsmith(oribatid$envir,scannf=FALSE)

## detrending of the analysis (residuals of regression onto xy coordinates)
hsEnv.detr <- pcaivortho(hsEnv,oribatid$xy,scannf=FALSE)

## MSPA of the detrended analysis
mspaEnv <- mspa(hsEnv.detr,cn,scannf=FALSE,nf=2)
scatter(mspaEnv)



## SPECIES DATA ##
## PCA of species abundances, after Hellinger transformation
pcaFau <- dudi.pca(hellTrans(oribatid$fau),scale=FALSE,scannf=FALSE)

## detrending of this PCA
pcaFau.detr <- pcaivortho(pcaFau,oribatid$xy,scannf=FALSE)

# MSPA of the detrended analysis
mspaFau <- mspa(pcaFau.detr,cn,scannf=FALSE,nf=2)
scatter(mspaFau)



## CANONICAL MSPA ##
## RDA species ~ envir
## (species abundances predicted by environment)
## note: RDA = 'PCAIV' (PCA with Instrumental Variables)
rda1 <- pcaiv(dudi=pcaFau.detr, df=oribatid$envir,scannf=FALSE,nf=2)

## canonical MSPA (species predicted by environment)
mspaCan1 <- mspa(dudi=rda1, lw=cn, scannf=FALSE, nf=2)
scatter(mspaCan1)

## same analysis, using a non-parametric centring
mspaCan1NP <- mspa(dudi=rda1, lw=cn, scannf=FALSE, nf=2,cent="sim",nper=999)
scatter(mspaCan1NP) # basically no change



## PARTIAL CANONICAL MSPA ##
## partial RDA species ~ envir
## (species abundances not predicted by environment)
rda2 <- pcaivortho(dudi=pcaFau.detr,df=oribatid$envir,scannf=FALSE,nf=2)

## partial canonical MSPA
mspaCan2 <- mspa(dudi=rda2, lw=cn, scannf=FALSE, nf=2)
scatter(mspaCan2) # nothing left
}



