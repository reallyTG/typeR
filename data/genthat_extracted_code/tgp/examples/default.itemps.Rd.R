library(tgp)


### Name: default.itemps
### Title: Default Sigmoidal, Harmonic and Geometric Temperature Ladders
### Aliases: default.itemps
### Keywords: misc

### ** Examples

## comparing the different ladders
geo <- default.itemps(type="geometric")
har <- default.itemps(type="harmonic")
sig <- default.itemps(type="sigmoidal")
par(mfrow=c(2,1))
matplot(cbind(geo$k, har$k, sig$k), pch=21:23,
        main="inv-temp ladders", xlab="indx",
        ylab="itemp")
legend("topright", pch=21:23, 
       c("geometric","harmonic","sigmoidal"), col=1:3)
matplot(log(cbind(sig$k, geo$k, har$k)), pch=21:23,
        main="log(inv-temp) ladders", xlab="indx",
        ylab="itemp")

## Not run: 
##D ## using Importance Tempering (IT) to improve mixing
##D ## on the motorcycle accident dataset
##D library(MASS)
##D out.it <- btgpllm(X=mcycle[,1], Z=mcycle[,2], BTE=c(2000,22000,2),
##D         R=3, itemps=default.itemps(), bprior="b0", trace=TRUE, 
##D         pred.n=FALSE)
##D 
##D ## compare to regular tgp w/o IT
##D out.reg <- btgpllm(X=mcycle[,1], Z=mcycle[,2], BTE=c(2000,22000,2),
##D         R=3, bprior="b0", trace=TRUE, pred.n=FALSE)
##D 
##D ## compare the heights explored by the three chains:
##D ## REG, combining all temperatures, and IT
##D p <- out.it$trace$post
##D L <- length(p$height)
##D hw <- suppressWarnings(sample(p$height, L, prob=p$wlambda, replace=TRUE))
##D b <- hist2bar(cbind(out.reg$trace$post$height, p$height, hw))
##D par(mfrow=c(1,1))
##D barplot(b, beside=TRUE, xlab="tree height", ylab="counts", col=1:3,
##D         main="tree heights encountered")
##D legend("topright", c("reg MCMC", "All Temps", "IT"), fill=1:3)
## End(Not run)



