library(DoE.base)


### Name: show.oas
### Title: Function to display list of available orthogonal arrays
### Aliases: show.oas
### Keywords: array design

### ** Examples

   ## the first 10 orthogonal arrays with 24 to 28 runs
   show.oas(nruns = c(24,28))
   ## the first 10 orthogonal arrays with 24 to 28 runs
   ## excluding child arrays
   show.oas(nruns = c(24,28), parents.only=TRUE)
   ## the orthogonal arrays with 4 2-level factors, one 4-level factor and one 5-level factor
   show.oas(factors = list(nlevels=c(2,4,5),number=c(4,1,1)))
   ## show them all with quality metrics
   show.oas(factors = list(nlevels=c(2,4,5),number=c(4,1,1)), show=Inf, showmetrics=TRUE)
   ## pick only those with no complete confounding of any degrees of freedom
   show.oas(factors = list(nlevels=c(2,4,5),number=c(4,1,1)), GRgt3="ind", showmetrics=TRUE)
   ## the orthogonal arrays with 4 2-level factors, one 7-level factor and one 5-level factor
   show.oas(factors = list(nlevels=c(2,7,5),number=c(4,1,1)))
   ## the latter orthogonal arrays with the nlevels notation 
   ## (that can also be used in a call to oa.design subsequently)
   show.oas(nlevels = c(2,7,2,2,5,2))
   ## calling arrays by name 
   show.oas(name=c("L12.2.11", "L18.2.1.3.7"))



