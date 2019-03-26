library(BayesDA)


### Name: meta
### Title: Results of 22 Clinical Trials of beta-Blockers
### Aliases: meta
### Keywords: datasets

### ** Examples

data(meta)
names(meta)
# Calculating empirical log-odds and its sampling variances:
y <- apply(meta, 1, function(x) log( (x[4]/(x[5]-x[4]))/(x[2]/(x[3]-x[2])) ) )
s2 <- apply(meta, 1, function(x) 1/(x[5]-x[4]) + 1/x[4] +1/(x[3]-x[2]) + 1/x[2] )  
cbind("Study number"=meta[,1], "empirical log odds"=y, "empirical sampling variance of y"=s2)
#if(require(meta)){
#   funnel(y, sqrt(s2))
#   radial(y, sqrt(s2))
#}




