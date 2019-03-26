library(rowr)


### Name: buffer
### Title: Pads an object to a desired length, either with replicates of
###   itself or another repeated object.
### Aliases: buffer

### ** Examples

buffer(c(1,2,3),20)
buffer(matrix(c(1,2,3,4),nrow=2),20)
buffer(list(1,2,3),20)
df<-data.frame(as.factor(c('Hello','Goodbye')),c(1,2))
buffer(df,5)
buffer((factor(x=c('Hello'))),5)



