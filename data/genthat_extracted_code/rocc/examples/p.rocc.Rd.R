library(rocc)


### Name: p.rocc
### Title: Making predictions using the ROC based classifier
### Aliases: p.rocc
### Keywords: classif

### ** Examples

#### tr.rocc

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




#### p.rocc

### just an example: classification of the training samples
p.rocc(trocc=predictor,newsample=g)
predictions<-p.rocc(trocc=predictor,newsample=g)
table(predictions,out)
## all correctly classified because newsample is the training set
## (try UNSEEN validation data instead)






