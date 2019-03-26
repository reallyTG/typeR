library(BioMark)


### Name: HCthresh
### Title: Biomarker thresholding by Higher Criticism
### Aliases: HCthresh
### Keywords: htest models

### ** Examples

data(spikedApples)
bms <- get.biom(spikedApples$dataMatrix, rep(0:1, each = 10),
                type = "coef", fmethod = "studentt")
bms.pvalues <- 2 * (1 - pt(abs(bms[[1]]), 18))
sum(bms.pvalues < .05)                           ## 15
sum(p.adjust(bms.pvalues, method = "fdr") < .05) ## 4
signif.bms <- HCthresh(bms.pvalues, plotit = TRUE)
length(signif.bms)                               ## 11



