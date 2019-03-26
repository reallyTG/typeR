library(pensim)


### Name: opt1D
### Title: Parallelized repeated tuning of Lasso or Ridge penalty parameter
### Aliases: opt1D
### Keywords: regression survival

### ** Examples

data(beer.exprs)
data(beer.survival)

##select just 100 genes to speed computation:
set.seed(1)
beer.exprs.sample <- beer.exprs[sample(1:nrow(beer.exprs), 100), ]

gene.quant <- apply(beer.exprs.sample, 1, quantile, probs=0.75)
dat.filt <- beer.exprs.sample[gene.quant>log2(100), ]
gene.iqr <- apply(dat.filt, 1, IQR)
dat.filt <- as.matrix(dat.filt[gene.iqr>0.5, ])
dat.filt <- t(dat.filt)

##define training and test sets
set.seed(1)
trainingset <- sample(rownames(dat.filt), round(nrow(dat.filt)/2))
testset <- rownames(dat.filt)[!rownames(dat.filt) %in% trainingset]

dat.training <- data.frame(dat.filt[trainingset, ])
pheno.training <- beer.survival[trainingset, ]

library(survival)
surv.training <- Surv(pheno.training$os, pheno.training$status)

dat.test <- data.frame(dat.filt[testset, ])
all.equal(colnames(dat.training), colnames(dat.test))
pheno.test <- beer.survival[testset, ]
surv.test <- Surv(pheno.test$os, pheno.test$status)

##ideally nsim should be on the order of 50,  but this slows computation
##50x without parallelization.
set.seed(1)
system.time(output <- opt1D(nsim=1, nprocessors=1, setpen="L2", response=surv.training,
 penalized=dat.training, fold=10, positive=FALSE, standardize=TRUE, 
 minlambda2=0.2, maxlambda2=100))

##Try again using two processors:
system.time(output <- opt1D(nsim=2, nprocessors=2, setpen="L2", response=surv.training,
 penalized=dat.training, fold=10, positive=FALSE, standardize=TRUE, 
 minlambda2=0.2, maxlambda2=100))

cc <- output[which.max(output[, "cvl"]), -(1:2)]  #coefficients
sum(abs(cc)>0)  #count non-zero coefficients

preds.training <- as.matrix(dat.training) %*% cc
preds.training.median <- median(preds.training)
preds.training.dichot <- ifelse(preds.training > preds.training.median, "high risk", "low risk")
preds.training.dichot <- factor(preds.training.dichot[, 1], levels=c("low risk", "high risk"))
preds.test <- as.matrix(dat.test) %*% cc
preds.test.dichot <- ifelse(preds.test > preds.training.median, "high risk", "low risk")
preds.test.dichot <- factor(preds.test.dichot[, 1], levels=c("low risk", "high risk"))

coxphfit.training <- coxph(surv.training~preds.training.dichot)
survfit.training <- survfit(surv.training~preds.training.dichot)
summary(coxphfit.training)
coxphfit.test <- coxph(surv.test~preds.test.dichot)
survfit.test <- survfit(surv.test~preds.test.dichot)
summary(coxphfit.test)

(p.training <- signif(summary(coxphfit.training)$logtest[3], 2))  #likelihood ratio test
(hr.training <- signif(summary(coxphfit.training)$conf.int[1], 2))
(hr.lower.training <- summary(coxphfit.training)$conf.int[3])
(hr.upper.training <- summary(coxphfit.training)$conf.int[4])
par(mfrow=c(1, 2))
plot(survfit.training,
     col=c("black", "red"), 
     conf.int=FALSE, 
     xlab="Months", 
     main="TRAINING", 
     ylab="Overall survival")
xmax <- par("usr")[2]
text(x=xmax, y=0.9, lab=paste("HR=", hr.training), pos=2)
text(x=xmax, y=0.8, lab=paste("p=", p.training, "", sep=""), pos=2)
tmp <- summary(preds.training.dichot)
text(x=c(xmax, xmax), y=c(0.7, 0.6), lab=paste(tmp, names(tmp)), col=1:2, pos=2)
(p.test <- signif(summary(coxphfit.test)$logtest[3], 2))  #likelihood ratio test
(hr.test <- signif(summary(coxphfit.test)$conf.int[1], 2))
(hr.lower.test <- summary(coxphfit.test)$conf.int[3])
(hr.upper.test <- summary(coxphfit.test)$conf.int[4])
plot(survfit.test, 
     col=c("black", "red"), 
     conf.int=FALSE, 
     xlab="Months", 
     main="TEST")
xmax <- par("usr")[2]
text(x=xmax, y=0.55, lab=paste("HR=", hr.test), pos=2)
text(x=xmax, y=0.45, lab=paste("p=", p.test, "", sep=""), pos=2)
tmp <- summary(preds.test.dichot)
text(x=c(xmax, xmax), y=c(0.3, 0.2), lab=paste(tmp, names(tmp)), col=1:2, pos=2)



