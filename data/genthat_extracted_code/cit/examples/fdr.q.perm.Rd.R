library(cit)


### Name: fdr.q.perm
### Title: Nonparametric permutation-based tail-area FDR Values, q-values
### Aliases: fdr.q.perm
### Keywords: q-value

### ** Examples

rowno=100
colno=100
X = as.data.frame(matrix(rnorm(rowno*colno),nrow=rowno,ncol=colno))
Y = as.data.frame(matrix(rnorm(rowno*colno),nrow=rowno,ncol=colno))
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
for(perm in 1:nperm){
	X1 = X[order(runif(colno)),]
	perml[[perm]] = myanalysis(X1,Y)
}

## FDR results
fdr.q.perm(obs$pvalue,perml,"pvalue",colno)




