library(pensim)


### Name: scan.l1l2
### Title: Function calculate cross-validated likelihood on a regular grid
###   of L1/L2 penalties
### Aliases: scan.l1l2
### Keywords: regression survival

### ** Examples

data(beer.exprs)
data(beer.survival)

##select just 250 genes to speed computation:
set.seed(1)
beer.exprs.sample <- beer.exprs[sample(1:nrow(beer.exprs), 250), ]

gene.quant <- apply(beer.exprs.sample, 1, quantile, probs=0.75)
dat.filt <- beer.exprs.sample[gene.quant>log2(150), ]
gene.iqr <- apply(dat.filt, 1, IQR)
dat.filt <- as.matrix(dat.filt[gene.iqr>1, ])
dat.filt <- t(dat.filt)

##define training and test sets
set.seed(9)
trainingset <- sample(rownames(dat.filt), round(nrow(dat.filt)/2))
testset <- rownames(dat.filt)[!rownames(dat.filt)%in%trainingset]

dat.training <- data.frame(dat.filt[trainingset, ])
pheno.training <- beer.survival[trainingset, ]

library(survival)
surv.training <- Surv(pheno.training$os, pheno.training$status)

dat.test <- data.frame(dat.filt[testset, ])
all.equal(colnames(dat.training), colnames(dat.test))
pheno.test <- beer.survival[testset, ]
surv.test <- Surv(pheno.test$os, pheno.test$status)

set.seed(9)
system.time(output <- scan.l1l2(L1range=c(0.2, 3.2), L2range=c(2, 30), 
L1.ngrid=10, L2.ngrid=10, polydegree=1, nprocessors=1, 
response=surv.training,  penalized=dat.training,  fold=4, positive=FALSE, standardize=TRUE))

##Note that the cvl surface is not smooth because a different folding of
##the data was used for each cvl calculation
image(x=seq(output$L1range[1], output$L1range[2], length.out=nrow(output$cvl)), 
y=seq(output$L2range[1], output$L2range[2], length.out=ncol(output$cvl)), 
z=output$cvl,
xlab="lambda1",
ylab="lambda2",
main="red is higher cross-validated likelihood")



