library(VLMC)


### Name: residuals.vlmc
### Title: Compute Residuals of a Fitted VLMC Object
### Aliases: residuals.vlmc
### Keywords: ts models

### ** Examples

example(vlmc)
rp <- residuals(vlmc.pres)
stopifnot(all(abs(apply(rp[-1,],1,sum)) < 1e-15))
matplot(seq(presidents), rp, ylab = "residuals", type="l")
## ``Tukey-Anscombe'' (the following is first stab at plot method):
matplot(fitted(vlmc.pres), rp, ylab = "residuals", xaxt = "n",
        type="b", pch=vlmc.pres$alpha)
axis(1, at = 0:(vlmc.pres$alpha.len-1),
     labels = strsplit(vlmc.pres$alpha,"")[[1]])


summary(rd <- residuals(vlmc.pres, type = "dev"))
rd[1:7]
## sum of squared dev.residuals === deviance :
all.equal(sum(rd[-1] ^ 2),
          deviance(vlmc.pres))
## Don't show: 
stopifnot(all.equal(sum(rd[-1] ^ 2),
                    deviance(vlmc.pres),tol=1e-12))
## End(Don't show)



