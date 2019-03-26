## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(
  echo = TRUE,
  message = FALSE,
  warning = FALSE
)

## ------------------------------------------------------------------------
rm(list=ls())
library(dplyr)
library(prozor)
data(fdrSample)
x <-dplyr::arrange(fdrSample, score2)
knitr::kable(head(fdrSample))


## ------------------------------------------------------------------------
table(grepl("REV_",fdrSample$proteinID))

## ------------------------------------------------------------------------
fdr1 <- computeFDR(fdrSample$score, grepl("REV_",fdrSample$proteinID),larger_better = FALSE)
plotFDR(fdr1)

## ------------------------------------------------------------------------
knitr::kable(head(data.frame(fdr1)))

## ------------------------------------------------------------------------
knitr::kable(head(data.frame(ID = fdrSample$proteinID[fdr1$order], fdr1)))

## ------------------------------------------------------------------------
fdr1 <- computeFDRwithID(fdrSample$score,fdrSample$proteinID, decoy = "REV_",larger_better = FALSE)
knitr::kable(head(data.frame(fdr1)))

## ------------------------------------------------------------------------
plot(fdr1$score, fdr1$SimpleFDR, type="l", xlim=c(0,0.002), ylim=c(0,0.0005))
lines(fdr1$score, fdr1$qValue_SimpleFDR, col=3, type="l", xlim=c(0,0.002), ylim=c(-0.002,0))

## ------------------------------------------------------------------------
names(fdr1)

(score01G <- predictScoreFDR(fdr1,qValue = 5,method = "FPR"))
dim(dplyr::filter(fdrSample, score < score01G))

(score01G <- predictScoreFDR(fdr1,qValue = 1,method = "FPR"))
dim(dplyr::filter(fdrSample, score < score01G))

(score01K <- predictScoreFDR(fdr1,qValue = 1,method = "SimpleFDR"))
dim(dplyr::filter(fdrSample, score < score01K))


