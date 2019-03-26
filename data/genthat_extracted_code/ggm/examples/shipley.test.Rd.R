library(ggm)


### Name: shipley.test
### Title: Test of all independencies implied by a given DAG
### Aliases: shipley.test
### Keywords: graphs models multivariate

### ** Examples

## A decomposable model for the mathematics marks data
data(marks)
dag <- DAG(mechanics ~ vectors+algebra, vectors ~ algebra, 
statistics ~ algebra+analysis, analysis ~ algebra)
shipley.test(dag, cov(marks), n=88)



