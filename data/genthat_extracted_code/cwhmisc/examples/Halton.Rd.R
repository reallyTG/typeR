library(cwhmisc)


### Name: Halton
### Title: Halton's quasi-random numbers
### Aliases: Halton HS247
### Keywords: distribution

### ** Examples

 par(mfrow=c(2,2))
 n <- 400
 q1 <- HS247(2,n,c(2,2),c(0,pi/10))
 q2 <- HS247(2,n,c(2,3))
 q3 <- HS247(2,n,c(2,5))
 q4 <- HS247(2,n,c(17,19)) # prone to correlations
 q5 <- HS247(2,n,c(2,3),c(pi/10,pi/10))
 of <- 0.2
 q6 <- HS247(2,n,c(2,3),c(pi/10+of,pi/10+of))
 ## Not run: 
##D    plot  (q1,pch="+",col="blue",cex=0.5,xlab="roots = (2,2), +blue, green")
##D    points(q2,pch=4, col="green",cex=0.5)
##D    plot  (q2,pch=4,col="green",cex=0.5,xlab="roots = (2,3),
##D           :green, (2,5) :red, (17,19) magenta")
##D    points(q3,pch=":",col="red")
##D    points(q4,pch=4,col="magenta",cex=0.5)
##D    plot  (q2,pch=4,col="green",cex=0.5,xlab="roots = 2, 2, green, red")
##D    points(q5,pch=5,cex=0.5,col="red")
##D    plot  (q5,pch=5,cex=0.5,col="red",xlab="roots = 2, 3, red")
##D    points(q6,pch="-")
##D  
## End(Not run)



