library(rowr)


### Name: vectorize
### Title: Vectorize a scalar function to work on any R object.
### Aliases: vectorize

### ** Examples

vectorize(`+`)(c(1,2,3))
vectorize(sum)(c(1,2,3),c(1,2,3))
# Compare these results to Vectorize, which does not vectorize sum at all.
Vectorize(sum)(c(1,2,3),c(1,2,3))
# Across data frame columns.
df<-data.frame(a=c(1,2,3),b=c(1,2,3))
vectorize(sum)(df$a,df$b)
# Once again, Vectorize gives a different result
Vectorize(sum)(df$a,df$b)
# Any combination of vectors, lists, matrices, or data frames an be used.
vectorize(`+`)(c(1,2,3),list(1,2,3),cbind(c(1,2,3)))



