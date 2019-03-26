library(rocc)


### Name: o.rocc
### Title: LOOCV using the ROC based classifier
### Aliases: o.rocc
### Keywords: classif

### ** Examples

## Random dataset and phenotype (small dataset for demonstration)
## Dataset should be a matrix
set.seed(100)
g <- matrix(rnorm(1000*25),ncol=25)
rownames(g) <- paste("Gene",1:1000,sep="_")
colnames(g) <- paste("Sample",1:25,sep="_")
## Phenotype should be a factor with levels 0 and 1: 
out <- as.factor(sample(c(0:1),size=25,replace=TRUE))
## Set the size of the Gene Signature
xgenes=c(50,500)

####### o.rocc

results<-o.rocc (g,out,xgenes)
results



####### performance of a given gene set by LOOCV in independent data

## load given genes (or take $genes from tr.rocc output)
genes<-paste("Gene",1:50,sep="_")
## load validation data
set.seed(101)
f <- matrix(rnorm(1000*25),ncol=25)
rownames(f) <- paste("Gene",1:1000,sep="_")
colnames(f) <- paste("Sample",1:25,sep="_")
outf <- as.factor(sample(c(0:1),size=25,replace=TRUE))
## reduce validation set to gene signature genes
f<-f[genes,]
## use all genes of reduced dataset for LOOCV
xgenes<-length(genes)

resultval<-o.rocc (f,outf,xgenes)
resultval


######### o.rocc results can be redone as a LOOCV with tr.rocc und p.rocc functions

results$concordance[,"50"]

## now with a LOOCV loop of tr.rocc and p.rocc
pr<-as.numeric(rep(NA,length(colnames(g))))
pr<-factor(pr,level=c(0,1))

for (i in 1:length(colnames(g))){
e<-g[,-i]
oute<-out[-i]
train<-tr.rocc(e,oute,xgenes=50)
procc<-p.rocc(train,g[,i]) ## ignore warnings, they dont apply here
pr[i]<-procc
}

all.equal(results$concordance[,"50"],pr)
# TRUE





