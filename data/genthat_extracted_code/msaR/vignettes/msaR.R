## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, message=FALSE)

## ------------------------------------------------------------------------
library(msaR)

# read some sequences from a Multiple sequence alignment file.
seqfile <- system.file("sequences","AHBA.aln", package="msaR")

# display the MSA.
msaR(seqfile, menu=F, overviewbox = F)

## ------------------------------------------------------------------------
msaR(seqfile, menu=F, overviewbox = F)

## ---- eval=FALSE---------------------------------------------------------
#  msaROutput("msa", width="100%")

## ---- eval=FALSE---------------------------------------------------------
#  output$msa <- renderMsaR(
#    msaR(seqfile)
#  )

