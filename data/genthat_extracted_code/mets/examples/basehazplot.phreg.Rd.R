library(mets)


### Name: basehazplot.phreg
### Title: Plotting the baslines of stratified Cox
### Aliases: basehazplot.phreg bplot basecumhaz

### ** Examples

data(TRACE)
dcut(TRACE) <- ~.
out1 <- phreg(Surv(time,status==9)~vf+chf+strata(wmicat.4),data=TRACE)

par(mfrow=c(2,2))
bplot(out1)
bplot(out1,stratas=c(0,3))
bplot(out1,stratas=c(0,3),col=2:3,lty=1:2,se=TRUE)
bplot(out1,stratas=c(0),col=2,lty=2,se=TRUE,polygon=FALSE)
bplot(out1,stratas=c(0),col=matrix(c(2,1,3),1,3),
            lty=matrix(c(1,2,3),1,3),se=TRUE,polygon=FALSE)



