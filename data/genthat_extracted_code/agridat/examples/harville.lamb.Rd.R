library(agridat)


### Name: harville.lamb
### Title: Birth weight of lambs from different lines/sires
### Aliases: harville.lamb
### Keywords: datasets

### ** Examples

data(harville.lamb)
dat <- harville.lamb
dat <- transform(dat, line=factor(line), sire=factor(sire), damage=factor(damage))

library(lattice)
bwplot(weight ~ line, dat,
       main="harville.lamb",
       xlab="line", ylab="birth weights")

## Not run: 
##D   if(require(lme4) & require(lucid)){
##D     
##D     m1 <- lmer(weight ~  -1 + line + damage + (1|sire), data=dat)
##D     summary(m1)
##D     vc(m1) # Khuri reports variances 0.5171, 2.9616
##D     ##      grp        var1 var2   vcov  sdcor
##D     ##     sire (Intercept) <NA> 0.5171 0.7191
##D     ## Residual        <NA> <NA> 2.962  1.721 
##D 
##D   }
## End(Not run)




