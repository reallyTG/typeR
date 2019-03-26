library(caroline)


### Name: regroup
### Title: Regroup a dataframe.
### Aliases: regroup

### ** Examples


df <- data.frame(a=rnorm(20),b=rpois(20,1))

mapping <- data.frame(old=rownames(df), new=rep(c('a','b'),10))
regroup(df, old=mapping$old, new=mapping$new)



