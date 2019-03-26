library(pensim)


### Name: opt.splitval
### Title: Parallelized calculation of split training/test set predictions
###   from L1/L2/Elastic Net penalized regression.
### Aliases: opt.splitval
### Keywords: regression survival

### ** Examples

data(beer.exprs)
data(beer.survival)

##select just 250 genes to speed computation:
set.seed(1)
beer.exprs.sample <- beer.exprs[sample(1:nrow(beer.exprs), 250), ]

gene.quant <- apply(beer.exprs.sample,1,quantile,probs=0.75)
dat.filt <- beer.exprs.sample[gene.quant>log2(100),]
gene.iqr <- apply(dat.filt,1,IQR)
dat.filt <- as.matrix(dat.filt[gene.iqr>0.5,])
dat.filt <- t(dat.filt)

library(survival)
surv.obj <- Surv(beer.survival$os,beer.survival$status)

##Single split training/test evaluation.  Ideally nsim would be 50 and
##fold=10, but this requires 100x more resources.
set.seed(1)
preds50 <- opt.splitval(optFUN="opt1D",scaling=TRUE,testset="equal",
             setpen="L1",nsim=1,nprocessors=1,
             response=surv.obj,penalized=dat.filt,fold=5,positive=FALSE,
             standardize=FALSE,trace=FALSE)

preds50.dichot <- preds50 > median(preds50)

surv.obj.50 <- surv.obj[match(names(preds50),rownames(beer.survival))]
coxfit50.continuous <- coxph(surv.obj.50~preds50)
coxfit50.dichot <- coxph(surv.obj.50~preds50.dichot)
summary(coxfit50.continuous)
summary(coxfit50.dichot)

##clean-up
rm(coxfit50.dichot,coxfit50.continuous,preds50,preds50.dichot,surv.obj,
   surv.obj.50,dat.filt,gene.iqr,gene.quant)



