library(SASxport)
Sys.setenv("TZ"="GMT")

df1 <- data.frame( f=c(1.0, -1.0), d=as.integer(c(-1,1) )  )
write.xport(df1, file='df1.xpt')
df2 <- read.xport(file='df1.xpt')

print(df1)
print(df2)

stopifnot(all(df1==df2))

df3 <- data.frame(x.continuous=seq(-100,100,by=0.5), x.integer=as.integer(seq(-100,100,by=0.5)) )
write.xport(df3, file='df3.xpt')
df4 <- read.xport(file='df3.xpt')

stopifnot(all(df3==df4))
