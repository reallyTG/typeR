## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----fig.width=4.5,fig.height=3------------------------------------------
library(Spectrum)
test1 <- Spectrum(blobs,showdimred=TRUE,fontsize=8,dotsize=2)

## ------------------------------------------------------------------------
names(test1)

## ----fig.width=4.5,fig.height=3------------------------------------------
library(Spectrum)
RNAseq <- brain[[1]]
test2 <- Spectrum(RNAseq,showdimred=TRUE,fontsize=8,dotsize=2)

## ----fig.width=4.5,fig.height=3------------------------------------------
library(Spectrum)
test3 <- Spectrum(brain,showdimred=TRUE,fontsize=8,dotsize=2)

## ----fig.width=4.5,fig.height=3------------------------------------------
library(Spectrum)
test4 <- Spectrum(circles,showpca=TRUE,method=2,fontsize=8,dotsize=2)

## ----fig.width=4.5,fig.height=3------------------------------------------
library(Spectrum)
test5 <- Spectrum(spirals,showpca=TRUE,method=2,fontsize=8,dotsize=2)

