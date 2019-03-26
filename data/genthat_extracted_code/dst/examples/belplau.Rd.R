library(dst)


### Name: belplau
### Title: Calculation of the degrees of Belief and Plausibility
### Aliases: belplau

### ** Examples

x <- bca(f=matrix(c(0,1,1,1,1,0,1,1,1),nrow=3, 
byrow = TRUE), m=c(0.2,0.5, 0.3), 
cnames =c("a", "b", "c"), infovarnames = "x", varnb = 1)
belplau(x)
y <- bca(f=matrix(c(1,0,0,1,1,1),nrow=2, 
byrow = TRUE), m=c(0.6, 0.4),  
cnames = c("a", "b", "c"),  infovarnames = "y", varnb = 1)
belplau(nzdsr(dsrwon(x,y)))
print("compare all elementary events")
xy1 <- addTobca(nzdsr(dsrwon(x,y)), 
matrix(c(0,1,0,0,0,1), nrow=2, byrow = TRUE))
belplau(xy1) 



