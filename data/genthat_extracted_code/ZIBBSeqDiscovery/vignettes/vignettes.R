## ---- results='hide'-----------------------------------------------------
rm(list = ls())
library(ZIBBSeqDiscovery)
data(kostic.x)
data(kostic.y)

## ------------------------------------------------------------------------
kostic.x <- kostic.x[which(rowSums(kostic.x)>0),]
kostic.x <- kostic.x[1:300, ]

## ------------------------------------------------------------------------
kostic.y <- cbind(1, kostic.y=="Tumor")
kostic.z <- cbind(1, log(colSums(kostic.x)))

## ---- warning=FALSE------------------------------------------------------
out.free <- fitZIBB(kostic.x, kostic.y, kostic.z, mode="free")

## ---- warning=FALSE------------------------------------------------------
out.constrained <- fitZIBB(kostic.x, kostic.y, kostic.z, mode="constrained", 
                           gn=3, betastart=out.free$betahat, 
                           psi.start=out.free$psi, eta.start=out.free$zeroCoef)

## ------------------------------------------------------------------------
out.free.mcc <- mcc.adj(out.free, kostic.x, kostic.y, kostic.z, K=4)
out.constrained.mcc <- mcc.adj(out.constrained, kostic.x, kostic.y, kostic.z, K=4)

## ------------------------------------------------------------------------
kostic.x.0 <- rowSums(kostic.x==0)
for (i in 1:5) {
  idx <- kostic.x.0 == (185-i)
  if (i==1) {
    sum.df <- data.frame(zero.counts = 185-i, N = sum(idx), 
                         Number.NA.free = sum(is.na(out.free$p[idx])), 
                         Number.NA.constrained = sum(is.na(out.constrained$p[idx])), 
                         Number.NA.free.MCC = sum(is.na(out.free.mcc$p[idx])), 
                         Number.NA.constrained.MCC = sum(is.na(out.constrained.mcc$p[idx])))
  } else {
    sum.df <- rbind(sum.df, c(185-i, sum(idx), sum(is.na(out.free$p[idx])),
                              sum(is.na(out.constrained$p[idx])),
                              sum(is.na(out.free.mcc$p[idx])),
                              sum(is.na(out.constrained.mcc$p[idx]))))
  }
}
print.data.frame(sum.df, right = FALSE)

