## ---- echo=FALSE, results='asis',include=F-------------------------------
library(MetProc) #Load package
metdata <- read.met(system.file("extdata/sampledata.csv", package="MetProc"),
headrow=3, metidcol=1, fvalue=8, sep=",", ppkey="PPP", ippkey="BPP")

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(metdata[1:5,1:7])

## ---- echo=FALSE, results='asis',include=F-------------------------------
results <- met_proc(metdata,plot=F)

## ---- echo=FALSE, results='asis'-----------------------------------------
dim(results[['keep']])
knitr::kable(results[['keep']][1:5,1:7])

## ---- echo=FALSE, results='asis'-----------------------------------------
dim(results[['remove']])
knitr::kable(results[['remove']][1:5,1:7])

