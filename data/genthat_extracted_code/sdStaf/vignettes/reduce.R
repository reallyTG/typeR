## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(sdStaf)
data(phytotoma)


## ------------------------------------------------------------------------
library(dismo)
predictor <- stack(list.files(path=paste(system.file(package="dismo"),'/ex', sep=''), pattern='grd', full.names=TRUE ))

# Read names 
names(predictor)

plot(predictor$bio1)


## ------------------------------------------------------------------------
buf.M <- stim.M(phytotoma[,2:3], radio = 131)

reduce_cut <- reduce.env(env = predictor, occ_data = phytotoma[,2:3], mask= buf.M)

plot(reduce_cut@cropa$bio1)

points(phytotoma[,2:3], pch=16,col='blue')


## ------------------------------------------------------------------------
 cor.show(reduce_cut)

# Define what variables we need to remove
 rd <- c('bio1','bio12','bio16','biome','bio8')

## ------------------------------------------------------------------------
cor.show(reduce_cut, rm=TRUE, var.rm = rd)

## ------------------------------------------------------------------------
var_reduce <- dropLayer(reduce_cut@cropa, rd)

names(var_reduce)

