library(FSA)


### Name: psdCI
### Title: Compute confidence intervals for PSD-X and PSD X-Y values.
### Aliases: psdCI
### Keywords: hplot

### ** Examples

## similar to Brenden et al. (2008)
n <- 997
ipsd <- c(130,491,253,123)/n

## single binomial
psdCI(c(0,0,1,1),ipsd,n=n)
psdCI(c(1,0,0,0),ipsd,n=n,label="PSD S-Q")

## single multinomial
psdCI(c(0,0,1,1),ipsd,n=n,method="multinomial")
psdCI(c(1,0,0,0),ipsd,n=n,method="multinomial",label="PSD S-Q")

## multiple multinomials (but see psdCalc())
lbls <- c("PSD S-Q","PSD Q-P","PSD P-M","PSD M-T","PSD","PSD-P")
imat <- matrix(c(1,0,0,0,
                 0,1,0,0,
                 0,0,1,0,
                 0,0,0,1,
                 0,1,1,1,
                 0,0,1,1),nrow=6,byrow=TRUE)
rownames(imat) <- lbls
imat

mcis <- t(apply(imat,MARGIN=1,FUN=psdCI,ptbl=ipsd,n=n,method="multinomial"))
colnames(mcis) <- c("Estimate","95% LCI","95% UCI")
mcis

## Multiple "Bonferroni-corrected" (for six comparisons) binomial method
bcis <- t(apply(imat,MARGIN=1,FUN=psdCI,ptbl=ipsd,n=n,conf.level=1-0.05/6))
colnames(bcis) <- c("Estimate","95% LCI","95% UCI")
bcis




