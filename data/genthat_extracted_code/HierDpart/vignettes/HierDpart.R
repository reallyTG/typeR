## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- install------------------------------------------------------------
#Install from CRAN
#install.packages("HierDpart")
## or you can install from github
#library(devtools)

#install_github("xinghuq/HierDpart")

library("HierDpart")


## ---- library------------------------------------------------------------
# example genepop file
f <- system.file('extdata',package='HierDpart')
infile <- file.path(f, "Island.gen")

## ------------------------------------------------------------------------
qD(infile,q=0,ncode=3)

## ------------------------------------------------------------------------
qDplot(infile,q="all",ncode=3)

## ------------------------------------------------------------------------
HAr=HierAr(infile, nreg=4, r=c(7,4,2,3), ncode=3)
print(HAr)

## ------------------------------------------------------------------------
HiD=HierD(infile, nreg=4, r=c(7,4,2,3), ncode=3)
print(HiD)

## ------------------------------------------------------------------------
He=HierHe(infile, nreg=4, r=c(7,4,2,3), ncode=3)
print(He)

## ------------------------------------------------------------------------
Hier_Fst=HierFst(infile, nreg=4, r=c(7,4,2,3), ncode=3)
print(Hier_Fst)

## ------------------------------------------------------------------------
Hier_D=HierD(infile, nreg=4, r=c(7,4,2,3), ncode=3)
print(Hier_D)

