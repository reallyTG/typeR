set.seed(123)

rnormtrunc <- function(n,mean,sd){
	b <- rep(0,n)
	flag<-rep(TRUE,n)
	while(any(flag)){
		b[flag] <- rnorm(n=sum(flag), mean=mean, sd=sd)
		flag<- (b<0) | (b>1)
	}
	return(b)
}

n <- 50
total <- rep(200,n)
mu.b <- 0.5
mu.w <- 0.5
mu.a <- 0.2


bb <- rnormtrunc(n, mean=mu.b, sd=0.2)
bw <- rnormtrunc(n, mean=mu.w, sd=0.2)
ba <- rnormtrunc(n, mean=mu.a, sd=0.2)

x1 <- round(runif(n) * total)
x2 <- round( (total - x1)*runif(n))
x3 <- total - x1 - x2

z11 <- round(bb*x1)
z21 <- round(bw*x2)
z31 <- round(ba*x3)

y <- z11 + z21 + z31
noty <- total - y

mydata <- data.frame(x1,x2,x3,y,noty,total)

# Different possible formula representations:

z.out <- zeirxc$new()
z.out$zelig( cbind(y,noty)~cbind(x1,x2,x3), N="total", data=mydata)
expect_that(length(z.out$getcoef()[[1]]), equals(3))



