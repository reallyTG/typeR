library(PHENIX)


### Name: pint.p
### Title: Phenotypic integration index (by Wagner) significance test
### Aliases: pint.p

### ** Examples


data(tussilago)
# Using a uniform distribution to generate the correlation matrices:
## A) Showing uniform distribution
unif1<-pint.p(traits=tussilago,n.replicates=1000, N.Pearson=4,plot="P")

## B) Showing the resulting null distribution and the real value (red line)
unif2<-pint.p(traits=tussilago,n.replicates=1000, N.Pearson=4,plot="R")

dev.new()
# Using a non-uniform distribution to generate the correlation matrices:
## A) Showing the Pearson product moment correlation coefficient distribution
prmo1<-pint.p(traits=tussilago,n.replicates=1000, N.Pearson=15,plot="P")
## B) Showing the resulting null distribution and the real value (red line)
prmo2<-pint.p(traits=tussilago,n.replicates=1000, N.Pearson=15,plot="R")

# Comparing the uniform and the non-uniform distributions
# as in Harder New Phytologist (2009) 183: 247-248

vari<-2 #variable to plot (INT.c)
toplot1<-unif2$Simulated.int[vari,]
toplot2<-prmo2$Simulated.int[vari,]
HIST<-hist(as.matrix(toplot2),plot=FALSE)
MaxY<-max(HIST$density)

Max<-max(toplot1,toplot2)
Min<-min(HIST$mids)
 plot(c(1,2),xlim=c((Min-0.05*Max),(Max+0.05*Max)),ylim=c(0,(MaxY+0.05*MaxY)),
type="n",ylab="Density",xlab="Maximum integration (percentage)")
 hist(as.matrix(toplot1),add=TRUE,freq=FALSE,breaks=28)
 hist(as.matrix(toplot2),add=TRUE,freq=FALSE,col="grey",breaks=8)
# And the real value as a red line:
abline(v=prmo1$Real[vari],lty=2, col="red")




