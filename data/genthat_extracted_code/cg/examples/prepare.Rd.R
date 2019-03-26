library(cg)


### Name: prepare
### Title: Prepare a cg data object from a data frame
### Aliases: prepare
### Keywords: datagen

### ** Examples

data(canine)
canine.data <- prepare(type="unpairedgroups", dfr=canine,
                       format="groupcolumns",
                       analysisname="Canine",
                       endptname="Prostate Volume",
                       endptunits=expression(plain(cm)^3),
                       digits=1, logscale=TRUE, refgrp="CC")

## Censored Data
data(gmcsfcens)
gmcsfcens.data <- prepare(type="onefactor",
                          dfr=gmcsfcens, format="groupcolumns",
                          analysisname="cytokine",
                          endptname="GM-CSF (pg/ml)",
                          logscale=TRUE)

## Paired Groups
data(anorexiaFT)
anorexiaFT.data <- prepare(type="paireddiff",  ## Partial matching
                           dfr=anorexiaFT, format="groupcolumns",
                           analysisname="Anorexia FT",
                           endptname="Weight",
                           endptunits="lbs",
                           expunitname="Patient",
                           digits=1, logscale=TRUE)



