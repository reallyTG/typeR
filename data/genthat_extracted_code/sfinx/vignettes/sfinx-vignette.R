## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(message=FALSE, warning=FALSE, comment = "#>", collapse = TRUE)

## ------------------------------------------------------------------------
library(sfinx)


## ------------------------------------------------------------------------
DataInputExampleFile[1:10,1:5]



## ------------------------------------------------------------------------
BaitIdentityExampleFile


## ---- eval = FALSE-------------------------------------------------------
#  sfinx(DataInputExampleFile, BaitIdentityExampleFile)
#  

## ------------------------------------------------------------------------
head(sfinx(DataInputExampleFile, BaitIdentityExampleFile)[[1]])



## ------------------------------------------------------------------------
sfinx(DataInputExampleFile, BaitIdentityExampleFile)[[2]]


## ---- eval = FALSE-------------------------------------------------------
#  sfinx(InputData, BaitVector, BackgroundRatio = 5, BackgroundIdentity = "automatic", BaitInfluence = FALSE, ConstantLimit = TRUE, FWERType = "B")
#  
#  

## ---- eval = FALSE-------------------------------------------------------
#  ?sfinx
#  
#  help(sfinx)
#  

