library(plotrix)


### Name: histStack
### Title: Histogram "stacked" by categories
### Aliases: histStack histStack.formula histStack.default
### Keywords: misc

### ** Examples

 set.seed(409)
 df<-data.frame(len=rnorm(100)+5,
  grp=sample(c("A","B","C","D"),100,replace=TRUE))
 histStack(len~grp,data=df,main="Default (rainbow) colors",
  xlab="Length category")
 histStack(len~grp,data=df,col="heat.colors",main="Heat colors",
  xlab="Length category",legend.pos="topright")
 histStack(len~grp,data=df,col=2:5,main="Colors by number",
  xlab="Length category",legend.pos=c(2.8,18))



