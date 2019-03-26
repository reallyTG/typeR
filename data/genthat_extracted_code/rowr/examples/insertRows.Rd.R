library(rowr)


### Name: insertRows
### Title: Inserts a matrix into another matrix.
### Aliases: insertRows

### ** Examples

df1<-data.frame(a=c(1,2,3),b=c(1,2,3),c=c(1,2,3))
insertRows(df1,data.frame(list('a','a','a')),5)
insertRows(df1,data.frame(list('a','a','a')),4)
insertRows(df1,data.frame(list('a','a','a')),3)
insertRows(df1,data.frame(list('a','a','a')),2)
insertRows(df1,data.frame(list('a','a','a')),1)
insertRows(df1,df1,3)



