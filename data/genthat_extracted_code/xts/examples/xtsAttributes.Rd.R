library(xts)


### Name: xtsAttributes
### Title: Extract and Replace xts Attributes
### Aliases: xtsAttributes xtsAttributes<-
### Keywords: utilities

### ** Examples

x <- xts(matrix(1:(9*6),nc=6),
         order.by=as.Date(13000,origin="1970-01-01")+1:9,
         a1='my attribute')

xtsAttributes(x)
xtsAttributes(x) <- list(a2=2020)

xtsAttributes(x)
xtsAttributes(x) <- list(a1=NULL)
xtsAttributes(x)



