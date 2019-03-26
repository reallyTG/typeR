library(mcc)


### Name: getAmoment
### Title: Four moments of Pearson correlation under permutation given
###   covariates
### Aliases: getAmoment

### ** Examples

set.seed(1)
######################################################################
## simulate a data matrix with 300 rows and 30 columns              ##
## assume x is a gene expression matrix with 300 genes, 30 samples  ##
## y is the clinical response (continuous)                          ##
######################################################################
m=300
n=30
x=matrix(rnorm(m*n),m,n)
y=rnorm(n)
out=getAmoment(x,y)
names(out)
out$EA2[1:10]   ## the second moments of A=sum(x*(centered phenotype)) 
		            ## under permutation for the the first 10 genes

## y can also be dichotomuous 
y=c(rep(1,15),rep(2,15))
out.dia=getAmoment(x,y)
length(out.dia$EA4)

## z is covariate. It can either be continuous or dichotomous 
## if z is dichotomous
z=c(rep(1,25),rep(2,5))
out.cov=getAmoment(x,y,z)
out.cov$EA2

## if z is continuous, then we need to splict z into K strata
## for example, suppose I sign K=4 strata for z
K=4
z=rexp(n)
cutpoint=as.vector(quantile(z, seq(0,1,b=1/K)))
newz=rep(0,n)
for (k in (1:K)){
	if (k<K) which.group=which((z>=cutpoint[k] & z<cutpoint[k+1])==TRUE)
	if (k==K) which.group=which((z>=cutpoint[k] & z<=cutpoint[k+1])==TRUE)
	newz[which.group]=k
}
out.cov.con=getAmoment(x,y,newz)
out.cov.con$EA3[1:5]




