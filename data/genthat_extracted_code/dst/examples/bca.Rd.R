library(dst)


### Name: bca
### Title: Basic chance assignment mass function
### Aliases: bca bpa

### ** Examples

f<- t(matrix(c(1,0,1,1),ncol=2))
m<- c(.9,.1)
cnames <- c("yes","no")
bca(f, m)
bca(f, m, cnames)
bca(f, m, cnames, varnb = 1)
x <- bca(f=matrix(c(0,1,1,1,1,0,1,1,1),nrow=3, 
byrow = TRUE), m=c(0.2,0.5, 0.3), 
cnames =c("a", "b", "c"), varnb = 1)
y <- bca(f=matrix(c(1,0,0,1,1,1),nrow=2, 
byrow = TRUE), m=c(0.6,0.4), 
cnames =c("a", "b", "c"),infovarnames = "y", varnb = 1)
frame <- bca(matrix(c(1,1,1), nrow=1), m=1, cnames = c("a","b","c"))



