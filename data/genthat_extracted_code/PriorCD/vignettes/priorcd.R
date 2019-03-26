## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----echo = T, results = 'hide'------------------------------------------
library(PriorCD)
e <- getData("drug.edgelist") #Get the two-column edge list of drug functional similarity network
brc <- getData("breast_cancer") #Get the FDA-approved drugs for breast cancer
#priorlist <- prior(e, brc, times = 5) #Prioritize drug. Times is 5 here, normally it should be set to 1000.

## ----echo = F------------------------------------------------------------
priorlist<-getData("priorlist")
head(priorlist)

## ------------------------------------------------------------------------
#getROC(e, brc, file=file.path("../inst/tempdir", "ROC.pdf"))

## ------------------------------------------------------------------------
knitr::include_graphics("../inst/roc.jpeg")

## ------------------------------------------------------------------------
candidates <- getData("brc_candidates")
getDDN(e, brc, candidates)

## ----echo = F, out.width = "95%"-----------------------------------------
knitr::include_graphics("../inst/html_page.jpg")

## ----results='hide'------------------------------------------------------
library(PriorCD)
r <- getData("drug.r") #Get example drug correlation matrix
fdr <- getData("drug.fdr") #Get example fdr matrix of drug correlation
m <- drsim(r, fdr, top = 0.5) #Convert into binary drug similarity matrix. top is determined by the number of drugs you want to leave.

## ----echo = F------------------------------------------------------------
m

