library(dst)


### Name: nzdsr
### Title: Normalization of a bca mass function
### Aliases: nzdsr

### ** Examples

x1 <- bca(f=matrix(c(1,0,1,1),nrow=2, byrow = TRUE), 
m=c(0.9,0.1), cnames =c("yes", "no"),
infovarnames = "x", varnb = 1)
x2 <- bca(f=matrix(c(0,1,1,1),nrow=2, byrow = TRUE), 
m=c(0.5,0.5), cnames =c("yes", "no"), 
infovarnames = "x", varnb = 1)
print("combination of x1 and x2")
x1x2 <- dsrwon(x1,x2)
nzdsr(x1x2) 

print("normalization of a bca definition.")
y2 <- bca(f=matrix(c(0,0,0,1,0,0,1,1,1),nrow=3, 
byrow = TRUE), m=c(0.2,0.5,0.3), 
cnames =c("a", "b", "c"), varnb = 1)
nzdsr(y2)  



