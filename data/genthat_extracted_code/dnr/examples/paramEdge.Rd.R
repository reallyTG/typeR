library(dnr)


### Name: paramEdge
### Title: Parameter estimation for static vertex case.
### Aliases: paramEdge

### ** Examples

input_network=rdNets[1:6]
model.terms=c("triadcensus.003", "triadcensus.012", "triadcensus.102", "triadcensus.021D", "gwesp");
model.formula = net~triadcensus(0:3)+gwesp(decay=0, fixed=FALSE, cutoff=30)-1;
graph_mode='digraph';
group='dnc';
alpha.glmnet=1
directed=TRUE;
method <- 'bayesglm'
maxlag <- 3
lambda=NA
intercept = c("edges")
cdim <- length(model.terms)
lagmat <- matrix(sample(c(0,1),(maxlag+1)*cdim,replace = TRUE),ncol = cdim)
ylag <- rep(1,maxlag)
exvar <- NA
out <- paramEdge(input_network,model.terms, model.formula,
                graph_mode='digraph',group,intercept = c("edges"),exvar=NA,
                maxlag = 3,
                lagmat = matrix(sample(c(0,1),(maxlag+1)*cdim,
                                       replace = TRUE),ncol = cdim),
                ylag = rep(1,maxlag),
                lambda = NA, method='bayesglm',
                alpha.glmnet=1)




