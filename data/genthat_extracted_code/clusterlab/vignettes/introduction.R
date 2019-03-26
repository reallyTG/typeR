## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----fig.width=3,fig.height=3--------------------------------------------
library(clusterlab)
synthetic <- clusterlab(centers=1,numbervec=100,pcafontsize=10)

## ----fig.width=3,fig.height=3--------------------------------------------
library(clusterlab)
synthetic <- clusterlab(centers=4,r=8,sdvec=c(2.5,2.5,2.5,2.5),   
                        alphas=c(1,1,1,1),centralcluster=FALSE,   
                        numbervec=c(50,50,50,50),pcafontsize=10)

## ----fig.width=3,fig.height=3--------------------------------------------
library(clusterlab)
synthetic <- clusterlab(centers=4,r=8,sdvec=c(1,1,2.5,2.5),   
                        alphas=c(1,1,1,1),centralcluster=FALSE,   
                        numbervec=c(50,50,50,50),pcafontsize=10)

## ----fig.width=3,fig.height=3--------------------------------------------
library(clusterlab)
synthetic <- clusterlab(centers=4,r=8,sdvec=c(2.5,2.5,2.5,2.5),   
                        alphas=c(1,2,1,1),centralcluster=FALSE,   
                        numbervec=c(50,50,50,50),pcafontsize=10)

## ----fig.width=3,fig.height=3--------------------------------------------
library(clusterlab)
synthetic <- clusterlab(centers=4,r=8,sdvec=c(2.5,2.5,2.5,2.5),   
                        alphas=c(1,1,1,1),centralcluster=FALSE,   
                        numbervec=c(15,50,50,50),pcafontsize=10)

## ----fig.width=3,fig.height=3--------------------------------------------
library(clusterlab)
synthetic <- clusterlab(centers=5,r=8,sdvec=c(2.5,2.5,2.5,2.5,2.5),   
                        alphas=c(2,2,2,2,2),centralcluster=TRUE,   
                        numbervec=c(50,50,50,50,50),pcafontsize=10)

## ----fig.width=3,fig.height=3--------------------------------------------
library(clusterlab)
synthetic <- clusterlab(centers=5,r=7,sdvec=c(2,2,2,2,2),   
                        alphas=c(2,2,2,2,2),centralcluster=FALSE,   
                        numbervec=c(50,50,50,50), seed=123, outliers=10, 
                        outlierdist=20, pcafontsize=10)

## ----fig.width=3,fig.height=3--------------------------------------------
library(clusterlab)
synthetic <- clusterlab(centers=7,r=9,sdvec=c(0.5,1,1.5,1.75,1.85,1.95,2.05),   
                        numbervec=c(50,50,50,50,50,50,50), seed=123,
                        pcafontsize=10)

## ----fig.width=3,fig.height=3--------------------------------------------
library(clusterlab)
synthetic <- clusterlab(centers=7,r=9,alphas=c(0.5,1,1.5,1.75,1.85,1.95,2.05),   
                        numbervec=c(50,50,50,50,50,50,50), seed=123,
                        pcafontsize=10)

## ----fig.width=3,fig.height=3--------------------------------------------
library(clusterlab)
synthetic <- clusterlab(centers=7,r=9,alphas=c(0.5,1,1.5,1.75,1.85,1.95,2.05), 
                        sdvec=c(0.5,1,1.5,1.75,2,2.25,2.25),
                        numbervec=c(50,50,50,50,50,50,50), seed=123,
                        pcafontsize=10)

## ----fig.width=3,fig.height=3--------------------------------------------
library(clusterlab)
synthetic <- clusterlab(centers=5,r=7,sdvec=c(6,6,6,6,6),   
                        alphas=c(2,2,2,2,2),centralcluster=FALSE,   
                        numbervec=c(50,50,50,50),rings=5,ringalphas=c(2,4,6,8,10,12), 
                        ringthetas = c(30,90,180,0,0,0), seed=123,
                        pcafontsize=10) # for a six cluster solution)

## ----fig.width=3,fig.height=3--------------------------------------------
library(clusterlab)
synthetic <- clusterlab(mode='random',centers=15,pcafontsize=10)

## ----fig.width=4.5,fig.height=4.5----------------------------------------
head(synthetic$identity_matrix)

