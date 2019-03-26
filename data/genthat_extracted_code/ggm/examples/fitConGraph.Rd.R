library(ggm)


### Name: fitConGraph
### Title: Fitting a Gaussian concentration graph model
### Aliases: fitConGraph
### Keywords: graphs models multivariate

### ** Examples

## A model for the mathematics marks (Whittaker, 1990)
data(marks)
## A butterfly concentration graph  
G <- UG(~ mechanics*vectors*algebra + algebra*analysis*statistics)
fitConGraph(G, cov(marks), nrow(marks))   
## Using the cliques

cl = list(c("mechanics", "vectors",   "algebra"), c("algebra", "analysis" ,  "statistics")) 
fitConGraph(G, S = cov(marks), n = nrow(marks), cli = cl) 



