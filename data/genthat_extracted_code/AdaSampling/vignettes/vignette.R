## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(AdaSampling)
data(brca)

## ----preview-------------------------------------------------------------
head(brca)

## ----prelim--------------------------------------------------------------
brca.mat <- apply(X = brca[,-10], MARGIN = 2, FUN = as.numeric)
brca.cls <- sapply(X = brca$cla, FUN = function(x) {ifelse(x == "malignant", 1, 0)})
rownames(brca.mat) <- paste("p", 1:nrow(brca.mat), sep="_")

## ----examinedata---------------------------------------------------------
table(brca.cls)
brca.cls

## ----noise---------------------------------------------------------------
set.seed(1)
pos <- which(brca.cls == 1)
neg <- which(brca.cls == 0)
brca.cls.noisy <- brca.cls
brca.cls.noisy[sample(pos, floor(length(pos) * 0.4))] <- 0
brca.cls.noisy[sample(neg, floor(length(neg) * 0.3))] <- 1

## ----examinenoisy--------------------------------------------------------
table(brca.cls.noisy)
brca.cls.noisy

## ----ada-----------------------------------------------------------------
Ps <- rownames(brca.mat)[which(brca.cls.noisy == 1)]
Ns <- rownames(brca.mat)[which(brca.cls.noisy == 0)]

brca.preds <- adaSample(Ps, Ns, train.mat=brca.mat, test.mat=brca.mat,
                  classifier = "knn", C= 1, sampleFactor = 1)
head(brca.preds)

accuracy <- sum(brca.cls.noisy == brca.cls) / length(brca.cls)
accuracy

accuracyWithAdaSample <- sum(ifelse(brca.preds[,"P"] > 0.5, 1, 0) == brca.cls) / length(brca.cls)
accuracyWithAdaSample


## ------------------------------------------------------------------------
adaSvmBenchmark(data.mat = brca.mat, data.cls = brca.cls.noisy, data.cls.truth = brca.cls, cvSeed=1)

