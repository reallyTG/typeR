library(Matrix.utils)


### Name: rBind.fill
### Title: Combine matrixes by row, fill in missing columns
### Aliases: rBind.fill

### ** Examples

df1 = data.frame(x = c(1,2,3), y = c(4,5,6))
rownames(df1) = c("a", "b", "c")
df2 = data.frame(x = c(7,8), z = c(9,10))
rownames(df2) = c("a", "d")
rBind.fill(df1,df2,fill=NA)
rBind.fill(as(df1,'Matrix'),df2,fill=0)
rBind.fill(as.matrix(df1),as(df2,'Matrix'),c(1,2),fill=0)
rBind.fill(c(1,2,3),list(4,5,6,7))
rBind.fill(df1,c(1,2,3,4))

m<-rsparsematrix(1000000,100,.001)
m2<-m
colnames(m)<-1:100
colnames(m2)<-3:102
system.time(b<-rBind.fill(m,m2))




