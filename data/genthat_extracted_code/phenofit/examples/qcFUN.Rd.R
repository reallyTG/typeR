library(phenofit)


### Name: getBits
### Title: Initial weights according to qc
### Aliases: getBits qc_summary qc_StateQA qc_5l qc_NDVIv4

### ** Examples

set.seed(100)
QA <- as.integer(runif(100, 0, 2^7))

r1 <- qc_summary(QA, wmin = 0.2, wmid = 0.5, wmax = 1)
r2 <- qc_StateQA(QA, wmin = 0.2, wmid = 0.5, wmax = 1)
r3 <- qc_5l(QA, wmin = 0.2, wmid = 0.5, wmax = 1)
r4 <- qc_NDVIv4(QA, wmin = 0.2, wmid = 0.5, wmax = 1)



