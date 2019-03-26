## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library("icd")
n <- 10000
set.seed(1441)
dat <- data.frame(id = n + seq(n),
                  icd_dx1 = sample(icd10cm2016$code, n, replace = TRUE),
                  icd_dx2 = sample(icd10cm2016$code, n, replace = TRUE),
                  icd_pcs1 = sample(icd10_pcs_2018$pcs, n, replace = TRUE),
                  icd_pcs2 = sample(icd10_pcs_2018$pcs, n, replace = TRUE)
)

## ----headdat-------------------------------------------------------------
head(dat)

## ----widelong------------------------------------------------------------
dx <- wide_to_long(dat[1:3])
pcs <- wide_to_long(dat[c(1, 4:5)], icd_name = "pcs", icd_regex = "icd_pcs")
head(dx)
head(pcs)

## ----calc----------------------------------------------------------------
pccc_dx <- comorbid_pccc_dx(dx)
pccc_pcs <- icd10_comorbid_pccc_pcs(pcs, 
                                    visit_name = "id", icd_name = "pcs")
res <- pccc_dx | pccc_pcs

## ----pcccbarplot, fig.asp=0.5, echo=FALSE--------------------------------
barplot(sort(colSums(res), decreasing = TRUE), 
        ylim = c(0, 70),
        ylab = "count", las = 2)

