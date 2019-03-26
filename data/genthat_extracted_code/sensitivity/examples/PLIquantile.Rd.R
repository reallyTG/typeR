library(sensitivity)


### Name: PLIquantile
### Title: Perturbed-Law based sensitivity Indices (PLI) for quantile
### Aliases: PLIquantile

### ** Examples

## No test: 

# Model: 3D function 

  distribution = list()
	for (i in 1:3) distribution[[i]]=list("norm",c(0,1))
  
# Monte Carlo sampling to obtain failure points

  N = 10000
	X = matrix(0,ncol=3,nrow=N)
	for(i in 1:3) X[,i] = rnorm(N,0,1)
     
	Y = 2 * X[,1] + X[,2] + X[,3]/2
	q95 = quantile(Y,0.95)
	
# sensitivity indices with perturbation of the mean 
  
	v_delta = seq(-1,1,1/10) 
	toto = PLIquantile(0.95,X,Y,q95,deltasvector=v_delta,
	  InputDistributions=distribution,type="MOY",samedelta=TRUE)

	par(mar=c(4,5,1,1))
	plot(v_delta,toto[,2],ylim=c(-4.5,4.5),xlab=expression(delta),
		ylab=expression(hat(S[i*delta])),pch=19,cex=1.5)
	points(v_delta,toto[,1],col="darkgreen",pch=15,cex=1.5)
	points(v_delta,toto[,3],col="red",pch=17,cex=1.5)
	abline(h=0,lty=2)
	legend(0.8,4.4,legend=c("X1","X2","X3"),
		col=c("darkgreen","black","red"),pch=c(15,19,17),cex=1.5)
  
## End(No test)



