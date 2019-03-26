library(dst)


### Name: dsrwon
### Title: Combination of two mass functions
### Aliases: dsrwon

### ** Examples

x1 <- bca(f=matrix(c(0,1,1,1,1,0,1,1,1),nrow=3, 
byrow = TRUE), m=c(0.2,0.5, 0.3), 
cnames =c("a", "b", "c"),  
infovarnames = "x", varnb=1)
x2 <- bca(f=matrix(c(1,0,0,1,1,1),nrow=2, 
byrow = TRUE), m=c(0.6, 0.4),  
cnames = c("a", "b", "c"),  
infovarnames = "x", varnb = 1)
dsrwon(x1,x2)



