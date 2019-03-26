library(dst)


### Name: tabresul
### Title: Prepare a table of results
### Aliases: tabresul

### ** Examples

 
x <- bca(f=matrix(c(0,1,1,1,1,0,1,1,1),nrow=3, 
byrow = TRUE), m=c(0.2,0.5, 0.3), 
cnames =c("a", "b", "c"), 
infovarnames = "x", varnb = 1)
y <- bca(f=matrix(c(1,0,0,1,1,1),nrow=2, 
byrow = TRUE), m=c(0.6, 0.4),  
cnames = c("a", "b", "c"), infovarnames = "y", varnb = 1)
xy <- dsrwon(x,y)
xyNorm <- nzdsr(xy)
tabresul(xyNorm) 
## print("Show all elementary events")
xy1 <- addTobca(nzdsr(dsrwon(x,y)), 
matrix(c(0,1,0,0,0,1), 
nrow=2, byrow = TRUE))
tabresul(xy1)
## print("Remove focal elements with 0 mass")
tabresul(xy1, removeZeroes = TRUE)
print("Retain singletons only")
tabresul(xy1, singletonsOnly = TRUE)



