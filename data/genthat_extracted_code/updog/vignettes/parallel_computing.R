## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width=4.5, 
  fig.height=3.5
)

## ---- message=FALSE------------------------------------------------------
library(parallel)
library(foreach)
library(doParallel)

## ---- message=FALSE------------------------------------------------------
library(updog)

## ------------------------------------------------------------------------
data("uitdewilligen")
ngenes <- ncol(uitdewilligen$refmat)

## ---- message=FALSE------------------------------------------------------
nc <- 2 ## number of cores. 
        ## You should change this for your specific computing environment.
cl <- parallel::makeCluster(nc)
doParallel::registerDoParallel(cl = cl)
stopifnot(foreach::getDoParWorkers() > 1) ## make sure cluster is set up.
gene_est <- foreach(i = 1:ngenes, 
                    .combine = cbind, 
                    .export = "flexdog") %dopar% {
                      ## fit flexdog
                      fout <- flexdog(refvec  = uitdewilligen$refmat[, i], 
                                      sizevec = uitdewilligen$sizemat[, i], 
                                      ploidy  = uitdewilligen$ploidy, 
                                      model   = "norm", 
                                      verbose = FALSE)
                      fout$geno
                      }
stopCluster(cl)

## ------------------------------------------------------------------------
nc <- 2 ## number of cores. 
        ## You should change this for your specific computing environment.
cl <- parallel::makeCluster(nc)
doParallel::registerDoParallel(cl = cl)
stopifnot(foreach::getDoParWorkers() > 1) ## make sure cluster is set up.
glist <- foreach(i = 1:ngenes, 
                 .export = "flexdog") %dopar% {
                   ## fit flexdog
                   fout <- flexdog(refvec  = uitdewilligen$refmat[, i], 
                                   sizevec = uitdewilligen$sizemat[, i], 
                                   ploidy  = uitdewilligen$ploidy, 
                                   model   = "norm", 
                                   verbose = FALSE)
                   fout
                   }
stopCluster(cl)

## ---- message=FALSE------------------------------------------------------
library(tidyverse)
prop_mis <- sapply(X = glist, FUN = function(x) x$prop_mis)
qplot(prop_mis, 
      xlab = "Posterior Proportion Mis-genotyped", 
      bins = 30) +
  theme_bw()

