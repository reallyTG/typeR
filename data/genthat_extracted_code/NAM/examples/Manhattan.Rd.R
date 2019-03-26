library(NAM)


### Name: Manhattan
### Title: Manhattan plot for Association Studies
### Aliases: plot.NAM
### Keywords: NAM GWAS

### ** Examples


data(tpod)
test=gwas2(y=y,gen=gen[,1:240],fam=fam,chr=chr[1:12])
par(mfrow=c(2,1))

# Example Manhattan 1
SIGNIF = 1+(2*test$PolyTest$lrt>4.9)
plot(x=test,pch=SIGNIF+3,lwd=SIGNIF,main="Example 2")

# Example Manhattan 2
plot(x=test,main="Example 3",pch=20,lwd=2)
Kern = ksmooth(1:240,test$PolyTest$lrt,bandwidth=1)
lines(Kern,type="l",lwd=2)




