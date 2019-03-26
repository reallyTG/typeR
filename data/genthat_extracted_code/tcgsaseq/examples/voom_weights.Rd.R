library(tcgsaseq)


### Name: voom_weights
### Title: Precision weights accounting for heteroscedasticity in RNA-seq
###   count data
### Aliases: voom_weights

### ** Examples

#rm(list=ls())
set.seed(123)

G <- 10000
n <- 12
p <- 2

y <- sapply(1:n, FUN=function(x){rnbinom(n=G, size=0.07, mu=200)})
x <- sapply(1:p, FUN=function(x){rnorm(n=n, mean=n, sd=1)})

my_w <-  voom_weights(y, x, doPlot=TRUE)
if (requireNamespace("limma", quietly = TRUE)) {
 w_voom <- limma::voom(counts=y, design=x, plot=TRUE) #slightly faster - same results
 all.equal(my_w, w_voom$weights)
}

## Not run: 
##D microbenchmark::microbenchmark(limma::voom(counts=t(y), design=x, plot=FALSE),
##D                               voom_weights(x, y, doPlot=FALSE), times=30)
## End(Not run)




