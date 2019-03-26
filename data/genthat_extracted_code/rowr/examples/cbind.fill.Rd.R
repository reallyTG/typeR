library(rowr)


### Name: cbind.fill
### Title: Combine arbitrary data types, filling in missing rows.
### Aliases: cbind.fill

### ** Examples

cbind.fill(c(1,2,3),list(1,2,3),cbind(c(1,2,3)))
cbind.fill(rbind(1:2),rbind(3:4))
df<-data.frame(a=c(1,2,3),b=c(1,2,3))
cbind.fill(c(1,2,3),list(1,2,3),cbind(c('a','b')),'a',df)
cbind.fill(a=c(1,2,3),list(1,2,3),cbind(c('a','b')),'a',df,fill=NA)



