library(memisc)


### Name: retain
### Title: Retain Objects in an Environment
### Aliases: retain
### Keywords: manip

### ** Examples

local({
  foreach(x=c(a,b,c,d,e,f,g,h),x<-1)
  cat("Objects before call to 'retain':\n")
  print(ls())
  retain(a)
  cat("Objects after call to 'retain':\n")
  print(ls())
})
x <- 1
y <- 2
retain(x)



