## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ------------------------------------------------------------------------
library(conStruct)
data(conStruct.data)

## ------------------------------------------------------------------------
# load the example data object
data(conStruct.data)

# look at the allele frequency data 
#	for the first 5 populations and 10 loci
conStruct.data$allele.frequencies[1:5,1:10]

## ------------------------------------------------------------------------
# load the example data object
data(conStruct.data)

# look at the geographic sampling coordinates 
#	for the first 5 populations
conStruct.data$coords[1:5,]

## ------------------------------------------------------------------------
# load the example data object
data(conStruct.data)

# look at pariwise geographic distance 
#	between the first 5 populations
conStruct.data$geoDist[1:5,1:5]

## ----eval=FALSE----------------------------------------------------------
#  conStruct.data <- structure2conStruct(infile = "~/Desktop/myStructureData.str",
#  									  onerowperind = TRUE,
#  									  start.loci = 3,
#  				 					  missing.datum = -9,
#  									  outfile = "~/Desktop/myConStructData")
#  

## ----eval=FALSE----------------------------------------------------------
#  conStruct.data <- structure2conStruct(infile = "~/Desktop/myStructureData.str",
#  									  onerowperind = FALSE,
#  									  start.loci = 3,
#  				 					  missing.datum = 0,
#  									  outfile = "~/Desktop/myConStructData")
#  

## ----eval=FALSE----------------------------------------------------------
#  pop.data.matrix <- matrix(NA,nrow=4,ncol=ncol(conStruct.data))
#  for(i in 1:nrow(pop.data.matrix)){
#  	pop.data.matrix[i,] <- colMeans(
#  								conStruct.data[
#  									which(pop.index==i),,
#  									drop=FALSE
#  								],na.rm=TRUE
#  							)
#  }

