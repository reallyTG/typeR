library(rocc)


### Name: tr.rocc
### Title: Training of a ROC based classifier
### Aliases: tr.rocc
### Keywords: classif

### ** Examples

### Random Dataset and phenotype
set.seed(100)
## Dataset should be a matrix
g <- matrix(rnorm(1000*25),ncol=25)
rownames(g) <- paste("Gene",1:1000,sep="_")
colnames(g) <- paste("Sample",1:25,sep="_")
## Phenotype should be a factor with levels 0 and 1: 
out <- as.factor(sample(c(0:1),size=25,replace=TRUE))

predictor <- tr.rocc (g,out,xgenes=50)

## find classifier specification:
predictor$positiv
predictor$negativ
predictor$cutoffvalue





