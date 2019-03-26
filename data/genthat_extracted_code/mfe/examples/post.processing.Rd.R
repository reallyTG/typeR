library(mfe)


### Name: post.processing
### Title: Post processing meta-features values
### Aliases: post.processing

### ** Examples

post.processing(runif(15))
post.processing(runif(15), c("min", "max"))
post.processing(runif(15), c("quantiles", "skewness"))
post.processing(runif(15), "histogram", bins=5, min=0, max=1)



