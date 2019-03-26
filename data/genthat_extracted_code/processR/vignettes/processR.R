## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(echo = TRUE,comment=NA,message=FALSE,
                      warning=FALSE,
                      fig.height=5,fig.width=7,
                      fig.align="center")

## ----eval=FALSE----------------------------------------------------------
#  if(!require(devtools)) install.packages("devtools")
#  devtools::install_github("cardiomoon/processR")

## ------------------------------------------------------------------------
library(processR)
sort(pmacro$no)

## ------------------------------------------------------------------------
pmacroModel(8)

## ------------------------------------------------------------------------
statisticalDiagram(8)

## ------------------------------------------------------------------------
labels=list(X="frame",M="justify",Y="donate",W="skeptic")
pmacroModel(8,labels=labels)

## ------------------------------------------------------------------------
moderator=list(name="skeptic",site=list(c("a","c")))
model=tripleEquation(X="frame",M="justify",Y="donate",moderator=moderator)
cat(model)

