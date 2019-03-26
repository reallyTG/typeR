library(ic.infer)


### Name: ic.test
### Title: Function for testing inequality-related hypotheses for
###   multivariate normal random variables
### Aliases: ic.test print.ict summary.ict
### Keywords: htest multivariate

### ** Examples

corr.plus <- matrix(c(1,0.5,0.5,1),2,2)
corr.null <- matrix(c(1,0,0,1),2,2)
corr.minus <- matrix(c(1,-0.5,-0.5,1),2,2)
## unrestricted vectors
x1 <- c(1, 1)
x2 <- c(-1, 1)
ict1 <- ic.test(ic.est(x1, corr.plus, ui=diag(c(1,1)), ci=c(0,0)))
ict1
summary(ict1)
ic.test(ic.est(x1, corr.plus, ui=diag(c(1,1)), ci=c(0,0)), s2=1, df.error=10)
ic.test(ic.est(x1, corr.minus, ui=diag(c(1,1)), ci=c(0,0)))
ic.test(ic.est(x1, corr.minus, ui=diag(c(1,1)), ci=c(0,0)), s2=1, df.error=10)
ic.test(ic.est(x2, corr.plus, ui=diag(c(1,1)), ci=c(0,0)))
ic.test(ic.est(x2, corr.plus, ui=diag(c(1,1)), ci=c(0,0)), s2=1, df.error=10)
ic.test(ic.est(x2, corr.minus, ui=diag(c(1,1)), ci=c(0,0)))
ic.test(ic.est(x2, corr.minus, ui=diag(c(1,1)), ci=c(0,0)), s2=1, df.error=10)

ict2 <- ic.test(ic.est(x2, corr.plus, ui=diag(c(1,1)), ci=c(0,0)),TP=2)
summary(ict2)
ict3 <- ic.test(ic.est(x1, corr.plus, ui=diag(c(1,1)), ci=c(0,0)),TP=3)
summary(ict3)

ict11 <- ic.test(ic.est(x1, corr.plus, ui=c(1,1), ci=0),TP=11, ui0.11 =c(1,0))
summary(ict11)

## larger example
corr.plus <- diag(1,8)
for (i in 1:7)
   for (j in (i+1):8)
     corr.plus[i,j] <- corr.plus[j,i] <- 0.5
u <- rbind(rep(1,6), c(-1,-1,-1,1,1,1), c(-1,0,1,0,0,0), c(0,0,0,-1,0,1))
ice <- ic.est(c(rep(1,4),rep(4,4)), corr.plus, ui=u, ci=rep(0,4), index=2:7, meq = 1)
ict1 <- ic.test(ice,TP=1)
summary(ict1)
ict2 <- ic.test(ice,TP=2)
summary(ict2)
ict11 <- ic.test(ice,TP=11)
summary(ict11,digits=3)
ice <- ic.est(c(rep(1,4),rep(4,4)), corr.plus, ui=u, ci=rep(0,4), index=2:7)
ict3 <- ic.test(ice, TP=3)
summary(ict3)



