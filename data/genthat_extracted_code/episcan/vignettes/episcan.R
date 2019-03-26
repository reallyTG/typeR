## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
options(stringsAsFactors = FALSE)

## ---- eval = F, error = F, results='hide'--------------------------------
#  install.packages(episcan)

## ---- echo = T, results='hide'-------------------------------------------
# load package
library(episcan)

## ---- echo = T, results='markup'-----------------------------------------
set.seed(321)
geno <- matrix(sample(0:2, size = 10000, 
                      replace = TRUE, prob = c(0.5, 0.3, 0.2)), ncol = 100)
dimnames(geno) <- list(row = paste0("IND", 1:nrow(geno)), 
                       col = paste0("rs", 1:ncol(geno)))
p <- c(rep(0, 60), rep(1, 40))
geno[1:5, 1:8]

## ---- echo = T, results='markup'-----------------------------------------
episcan(geno1 = geno, 
        pheno = p, 
        phetype = "case-control",
        outfile = "episcan_1geno_cc", 
        suffix = ".txt", 
        zpthres = 0.9, 
        chunksize = 20, 
        scale = TRUE)

## ---- echo = T, results='markup'-----------------------------------------
result <- read.table("episcan_1geno_cc.txt",
                     header = TRUE,
                     stringsAsFactors = FALSE)
head(result)

## ---- echo = T, results='markup'-----------------------------------------
# simulate data
geno1 <- matrix(sample(0:2, size = 10000, 
                       replace = TRUE, prob = c(0.5, 0.3, 0.2)), ncol = 100)
geno2 <- matrix(sample(0:2, size = 20000, 
                       replace = TRUE, prob = c(0.4, 0.3, 0.3)), ncol = 200)
dimnames(geno1) <- list(row = paste0("IND", 1:nrow(geno1)), 
                        col = paste0("rs", 1:ncol(geno1)))
dimnames(geno2) <- list(row = paste0("IND", 1:nrow(geno2)), 
                        col = paste0("exm", 1:ncol(geno2)))
p <- rnorm(100)

# scan epistasis
episcan(geno1 = geno1,
        geno2 = geno2,
        pheno = p, 
        phetype = "quantitative",
        outfile = "episcan_2geno_quant", 
        suffix = ".txt", 
        zpthres = 0.6, 
        chunksize = 50, 
        scale = TRUE)

