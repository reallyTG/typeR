library(ForwardSearch)


### Name: ForwardSearch.pointwise.asymptotics
### Title: Functions for asymptotic theory of Forward Search
### Aliases: ForwardSearch.pointwise.asymptotics

### ** Examples

#####################
#	EXAMPLE 1
#	Suppose n=100. Get asymptotic values for grid psi = (1, ... ,n)/n

n	<- 100
psi	<- seq(1,n-1)/n
FS	<- ForwardSearch.pointwise.asymptotics(psi)

#	Plot for biased normalisation
#	- matching choice of Atkinson and Riani (2000)

main <- "Pointwise confidence bands for n=100\n Biased normalisation"
ylab <-	"forward residual asymptotics"
 plot(psi,FS$median.biased,ylim=c(0,3),ylab=ylab,main=main,type="l")
lines(psi,FS$median.biased-2*FS$sdv.biased/sqrt(n))
lines(psi,FS$median.biased+2*FS$sdv.biased/sqrt(n))

#	Plot for unbiased normalisation

main <- "Pointwise confidence bands for n=100\n Unbiased normalisation"
ylab <-	"forward residual asymptotics"
 plot(psi,FS$c,ylim=c(0,3),ylab=ylab,main=main,type="l")
lines(psi,FS$c-2*FS$sdv.unbiased/sqrt(n))
lines(psi,FS$c+2*FS$sdv.unbiased/sqrt(n))




