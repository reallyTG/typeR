library(robustbase)


### Name: salinity
### Title: Salinity Data
### Aliases: salinity
### Keywords: datasets

### ** Examples

data(salinity)
summary(lm.sali  <-        lm(Y ~ . , data = salinity))
summary(rlm.sali <- MASS::rlm(Y ~ . , data = salinity))
summary(lts.sali <-    ltsReg(Y ~ . , data = salinity))

salinity.x <- data.matrix(salinity[, 1:3])
c_sal <- covMcd(salinity.x)
plot(c_sal, "tolEllipsePlot")

## Connection with boot package's version :
if(requireNamespace("boot")) { ## 'always'
 print( head(boot.sal <- boot::salinity        ) )
 print( head(robb.sal <- salinity [, c(4, 1:3)]) ) # difference: has one digit more
 ## Otherwise the same ?
 dimnames(robb.sal) <- dimnames(boot.sal)
 ## apart from the 4th column, they are "identical":
 stopifnot( all.equal(boot.sal[, -4], robb.sal[, -4], tol = 1e-15) )

 ## But the discharge ('X3', 'dis' or 'H2OFLOW')  __differs__ in two places:
 plot(cbind(robustbase = robb.sal[,4], boot = boot.sal[,4]))
 abline(0,1, lwd=3, col=adjustcolor("red", 1/4))
 D.sal <- robb.sal[,4] - boot.sal[,4]
 stem(robb.sal[,4] - boot.sal[,4])
 which(abs(D.sal) > 0.01) ## 2 8
 ## *two* typos (=> difference ~= 1) in the version of 'boot': obs. 2 & 8 !!!
 cbind(robb = robb.sal[,4], boot = boot.sal[,4], D.sal)
}# boot



