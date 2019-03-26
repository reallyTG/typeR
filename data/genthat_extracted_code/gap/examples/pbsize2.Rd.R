library(gap)


### Name: pbsize2
### Title: Power for case-control association design
### Aliases: pbsize2
### Keywords: misc

### ** Examples

## Not run: 
##D 
##D # single calc
##D m <- c("multiplicative","recessive","dominant","additive","overdominant")
##D for(i in 1:5) print(pbsize2(N=50,alpha=5e-2,gamma=1.1,p=0.1,kp=0.1, model=m[i]))
##D 
##D # for a range of sample sizes
##D pbsize2(p=0.1, N=c(25,50,100,200,500), gamma=1.1, kp=.1, alpha=5e-2, model='r')
##D    
##D # create a power table
##D f <- function(p)     
##D   pbsize2(p=p, N=seq(100,1000,by=100), gamma=1.1, kp=.1, alpha=5e-2, model='recessive')
##D m <- sapply( X=seq(0.1,0.9, by=0.1), f)
##D colnames(m) <- seq(0.1,0.9, by=0.1)
##D rownames(m) <- seq(100,1000,by=100)
##D print(round(m,2))
##D 
##D library(genetics)
##D m <- c("multiplicative","recessive","dominant","partialrecessive")
##D for(i in 1:4) print(power.casectrl(p=0.1, N=50, gamma=1.1, kp=.1, alpha=5e-2,
##D     minh=m[i]))
##D power.casectrl(p=0.1, N=c(25,50,100,200,500), gamma=1.1, kp=.1, alpha=5e-2,
##D     minh='r')
##D f <- function(p)
##D   power.casectrl(p=p, N=seq(100,1000,by=100), gamma=1.1, kp=.1, alpha=5e-2,
##D     minh='recessive')
##D m <- sapply( X=seq(0.1,0.9, by=0.1), f)
##D colnames(m) <- seq(0.1,0.9, by=0.1)
##D rownames(m) <- seq(100,1000,by=100)
##D print(round(m,2))
##D 
## End(Not run)



