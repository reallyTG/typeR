library(AssetPricing)


### Name: buildS
### Title: Build a piecewise linear price sensitivity function
### Aliases: buildS
### Keywords: utilities

### ** Examples

   lambda <- function(t) {
      tn <- 1:4
      A <- matrix(c(0,12,12,12,
              0,-16,16,64,
              20,30,30,0),nrow=4)
      B <- matrix(c(12,0,0,0,
               0,16,0,-16,
               0,-10,-10,0),nrow=4)
      s <- cut(t,breaks=c(0,tn),include.lowest=TRUE,labels=tn)
      s <- as.numeric(levels(s)[s])
      M <- matrix(A[s,] + B[s,]*t,ncol=ncol(A))
      M[!is.finite(M)] <- 0
      M
   }

   alpha <- vector("list",4)
   beta  <- vector("list",4)
   alpha[[1]] <- with(list(lambda=lambda),
	function(t) {
	A <- c(1,1,1)
        lll <- lambda(t)
        dnm <- apply(lll,1,sum)
        dnm[dnm==0] <- 1
        lll%*%A/dnm
   })
   beta[[1]] <- with(list(lambda=lambda),
	function(t) {
	B <- c(0,0,0)
        lll <- lambda(t)
        dnm <- apply(lll,1,sum)
        dnm[dnm==0] <- 1
        lll%*%B/dnm
   })
   alpha[[2]] <- with(list(lambda=lambda),
	function(t) {
	A <- c(1.495,1,1)
        lll <- lambda(t)
        dnm <- apply(lll,1,sum)
        dnm[dnm==0] <- 1
        lll%*%A/dnm
   })
   beta[[2]] <- with(list(lambda=lambda),
	function(t) {
	B <- c(-0.2475,0,0)
        lll <- lambda(t)
        dnm <- apply(lll,1,sum)
        dnm[dnm==0] <- 1
        lll%*%B/dnm
   })
   alpha[[3]] <- with(list(lambda=lambda),
	function(t) {
	A <- c(0.01,2.485,1)
        lll <- lambda(t)
        dnm <- apply(lll,1,sum)
        dnm[dnm==0] <- 1
        lll%*%A/dnm
   })
   beta[[3]] <- with(list(lambda=lambda),
	function(t) {
	B <- c(0,-0.2475,0)
        lll <- lambda(t)
        dnm <- apply(lll,1,sum)
        dnm[dnm==0] <- 1
        lll%*%B/dnm
   })
   alpha[[4]] <- with(list(lambda=lambda),
	function(t) {
	A <- c(0.01,0.01,3.475)
        lll <- lambda(t)
        dnm <- apply(lll,1,sum)
        dnm[dnm==0] <- 1
        lll%*%A/dnm
   })
   beta[[4]] <- with(list(lambda=lambda),
	function(t) {
	B <- c(0,0,-0.2475)
        lll <- lambda(t)
        dnm <- apply(lll,1,sum)
        dnm[dnm==0] <- 1
        lll%*%B/dnm
   })
   kn <- c(2,6,10,14)
   S  <- buildS(alpha,beta,kn,4)
   x  <- seq(0,14,length=41)
   t  <- seq(0,4,length=41)
   z  <- S(x,t)
## Not run: 
##D    persp(x,t,z,theta=150,phi=40,d=4,xlab="price",ylab="time",
##D          zlab="probability",ticktype="detailed")
## End(Not run)



