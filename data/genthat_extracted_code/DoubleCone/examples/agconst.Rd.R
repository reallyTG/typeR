library(DoubleCone)


### Name: agconst
### Title: Test null hypothesis of constant regression function against a
###   general, high-dimensional alternative
### Aliases: agconst
### Keywords: multiple isotonic regression model test

### ** Examples

	n=100
	x1=runif(n);x2=runif(n);xmat=cbind(x1,x2)
	mu=1:n;for(i in 1:n){mu[i]=20*max(x1[i]-2/3,x2[i]-2/3,0)^2}
	x1g=1:21/22;x2g=x1g
	par(mar=c(1,1,1,1))
	y=mu+rnorm(n)
	ans=agconst(y,xmat,nsim=0)
	grfit=matrix(nrow=21,ncol=21)
	for(i in 1:21){for(j in 1:21){
			if(sum(x1>=x1g[i]&x2>=x2g[j])>0){
				if(sum(x1<=x1g[i]&x2<=x2g[j])>0){
					f1=min(ans$thetahat[x1>=x1g[i]&x2>=x2g[j]])
					f2=max(ans$thetahat[x1<=x1g[i]&x2<=x2g[j]])
					grfit[i,j]=(f1+f2)/2
				}else{
					grfit[i,j]=min(ans$thetahat)
				}
			}else{grfit[i,j]=max(ans$thetahat)}
	}}
	persp(x1g,x2g,grfit,th=-50,tick="detailed",xlab="x1",ylab="x2",zlab="mu")
##to get p-value for test against constant function:
#	ans=agconst(y,xmat,nsim=1000)
#	ans$pval



