library(rowr)


### Name: rows
### Title: Allows row indexing without knowledge of dimensionality or
###   class.
### Aliases: rows

### ** Examples

rows(c('A','B','C'),c(1,3))
rows(list('A','B','C'),c(1,3))
df<-data.frame(a=c(1,2,3),b=c(1,2,3))
rows(df,3)



