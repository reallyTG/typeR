library(SharpeR)


### Name: pco_sropt
### Title: The 'confidence distribution' for maximal Sharpe ratio.
### Aliases: pco_sropt qco_sropt
### Keywords: distribution

### ** Examples


zeta.s <- 2.0
ope <- 253
ntest <- 50
df1 <- 4
df2 <- 6 * ope
rvs <- rsropt(ntest,df1=df1,df2=df2,zeta.s=zeta.s)
qvs <- seq(0,10,length.out=51)
pps <- pco_sropt(qvs,df1,df2,rvs[1],ope)
## Not run: 
##D if (require(txtplot))
##D  txtplot(qvs,pps)
## End(Not run)
pps <- pco_sropt(qvs,df1,df2,rvs[1],ope,lower.tail=FALSE)
## Not run: 
##D if (require(txtplot))
##D  txtplot(qvs,pps)
## End(Not run)

svs <- seq(0,4,length.out=51)
pps <- pco_sropt(2,df1,df2,svs,ope)
pps <- pco_sropt(2,df1,df2,svs,ope,lower.tail=FALSE)

pps <- pco_sropt(qvs,df1,df2,rvs[1],ope,lower.tail=FALSE)
pco_sropt(-1,df1,df2,rvs[1],ope)

qvs <- qco_sropt(0.05,df1=df1,df2=df2,z.s=rvs)
mean(qvs > zeta.s)
qvs <- qco_sropt(0.5,df1=df1,df2=df2,z.s=rvs)
mean(qvs > zeta.s)
qvs <- qco_sropt(0.95,df1=df1,df2=df2,z.s=rvs)
mean(qvs > zeta.s)
# test vectorization:
qv <- qco_sropt(0.1,df1,df2,rvs)
qv <- qco_sropt(c(0.1,0.2),df1,df2,rvs)
qv <- qco_sropt(c(0.1,0.2),c(df1,2*df1),df2,rvs)
qv <- qco_sropt(c(0.1,0.2),c(df1,2*df1),c(df2,2*df2),rvs)




