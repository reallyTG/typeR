library(pgraph)


### Name: pgraph
### Title: Calculate the Conditional Dependency Graph
### Aliases: pgraph

### ** Examples

library(splines)
set.seed(0)
p = 5;
n = 100;
tmp=runif(p-1,1,3)
s=c(0,cumsum(tmp));
s1=matrix(s,p,p)
cov.mat.true=exp(-abs(s1-t(s1)))
prec.mat.true=solve(cov.mat.true);
a=matrix(rnorm(p*n),n,p)
data.sa=a%*%chol(cov.mat.true);
true.graph = outer(1:p,1:p,f<-function(x,y){(abs(x-y)==1)})
methodlist = c("lasso","sam")
fit = vector(mode="list", length=2)
info = vector(mode="list", length=2)
auc = NULL
for(i in 1:2){
method = methodlist[i]
fit[[i]] = pgraph(data.sa, method = method)
info[[i]] = roc(fit[[i]]$statmat.pearson, true.graph)
auc[i] = sum(-diff(info[[i]][,1])*info[[i]][-1,2])
  cat(method, ': auc=', auc[i],'\n')
}



