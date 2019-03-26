library(fdrci)


### Name: fdr_od
### Title: Permutation-Based FDR and Confidence Interval
### Aliases: fdr_od
### Keywords: htest nonparametric

### ** Examples

nrow_=100
ncol_=100
X = as.data.frame(matrix(rnorm(nrow_*ncol_),nrow=nrow_,ncol=ncol_))
Y = as.data.frame(matrix(rnorm(nrow_*ncol_),nrow=nrow_,ncol=ncol_))
nperm = 10

myanalysis = function(X,Y){
	ntests = ncol(X)
	rslts = as.data.frame(matrix(NA,nrow=ntests,ncol=2))
	names(rslts) = c("ID","pvalue")
	rslts[,"ID"] = 1:ntests
	for(i in 1:ntests){
		fit = cor.test(X[,i],Y[,i],na.action="na.exclude",
			alternative="two.sided",method="pearson")
		rslts[i,"pvalue"] = fit$p.value
	}
	return(rslts)
} # End myanalysis

# Generate observed results
obs = myanalysis(X,Y)

## Generate permuted results
perml = vector('list',nperm)
for(p_ in 1:nperm){
	X1 = X[order(runif(ncol_)),]
	perml[[p_]] = myanalysis(X1,Y)
}

## FDR results
fdr_od(obs$pvalue,perml,"pvalue",ncol_,.05)



