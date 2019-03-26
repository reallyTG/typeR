library(HDMD)


### Name: HDMD-package
### Title: Structural Analysis Tools for High Dimensional Molecular Data
### Aliases: HDMD-package HDMD
### Keywords: package

### ** Examples

data(AA54)
#perform Factor Analysis on HDMD where D>>N
Factor54 = factor.pa.ginv(AA54, nfactors = 5, m=3, prerotate=TRUE, rotate="Promax", scores="regression")
Factor54

data(bHLH288)
bHLH_Seq = as.vector(bHLH288[,2])
grouping = t(bHLH288[,1])

#Transform Amino Acid Data into a biologically meaninful metric
AA54_MetricFactor1 = FactorTransform(bHLH_Seq, Replace=AAMetric, Factor=1, alignment=TRUE)

#Calculate the pairwise mahalanobis distances among groups given a discriminant function 
AA54_lda_Metric1 = lda(AA54_MetricFactor1, grouping)
AA54_lda_RawMetric1 = as.matrix(AA54_MetricFactor1) 
AA54_lda_RawMetric1Centered = scale(AA54_lda_RawMetric1, center = TRUE, scale = FALSE)
AA54_lda_RawMetric1Centered[c(20:25, 137:147, 190:196, 220:229, 264:273),1:8]
plot(-1*AA54_lda_RawMetric1Centered[,1], -1*AA54_lda_RawMetric1Centered[,2], pch = grouping, xlab="Canonical Variate 1", ylab="Canonical Variate 2", main="DA Scores (Centered Raw Coefficients)\nusing Factor1 (pah) from R transformation")
lines(c(0,0), c(-15,15), lty="dashed")
lines(c(-35,25), c(0,0), lty="dashed")

Mahala_1 = pairwise.mahalanobis(AA54_lda_RawMetric1Centered, grouping)
D = sqrt(Mahala_1$distance)
D



