library(LMest)


### Name: draw_lm_cov_latent_cont
### Title: Draw samples from LM model for continuous outcomes with
###   covariaates in the latent model
### Aliases: draw_lm_cov_latent_cont

### ** Examples

# draw a sample for 1000 units, 10 response variable and 2 covariates 
n=1000
TT = 5
k=2
nc = 2 #number of covariates
r = 3 #number of response variables
fort=TRUE

Mu  = matrix(c(-2,-2,0,0,2,2),r,k)
Si = diag(r)
Ga = matrix(c(-log(0.9/0.1),0.5,1),(nc+1)*(k-1),k)
Be = array(c(0,0.5,1),(nc+1)*(k-1))

#Simulate covariates
X1 = matrix(0,n,nc)
for(j in 1:nc) X1[,j]=rnorm(n)
X2 = array(0,c(n,TT-1,nc))
for (t in 1:(TT-1)) for(j in 1:nc){ 
	if(t==1){
		X2[,t,j] = 0.5*X1[,j]+rnorm(n)
	}else{
		X2[,t,j] = 0.5*X2[,t-1,j]+rnorm(n)
	}
}
	
out = draw_lm_cov_latent_cont(X1,X2,param="multilogit",Mu,Si,Be,Ga,fort=fort)



