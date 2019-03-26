library(emulator)


### Name: regressor.basis
### Title: Regressor basis function
### Aliases: regressor.basis regressor.multi
### Keywords: models

### ** Examples

regressor.basis(rep(5,6))
m <- matrix(1:27,9,3)
regressor.multi(m)
regressor.multi(m,func=function(x){c(a=88,x,x^2,x[1]^4)})


# and now a little example where we can choose the basis functions
# explicitly and see the effect it has.  Note particularly the poor
# performance of func2() in extrapolation:


func1 <- function(x){
  out <- c(1,cos(x))
  names(out) <- letters[1:length(x)]
  return(out)
}

func2 <- function(x){
  out <- c(1,cos(x),cos(2*x),cos(3*x))
  names(out) <- letters[1:length(x)]
  return(out)
}

func3 <- function(x){out <- c(1,x)
names(out)[1] <- "const"
return(out)
}

func.chosen <- func1


toy <- sort(c(seq(from=0,to=1,len=9),0.2))
toy <- as.matrix(toy)
colnames(toy) <- "a"
rownames(toy) <- paste("obs",1:nrow(toy),sep=".")

d.noisy <- as.vector(toy>0.5)+rnorm(length(toy))/40

fish <- 100
x <- seq(from=-1,to=2,len=1000)
A <- corr.matrix(toy,scales=fish)
Ainv <- solve(A)

 ## Now the interpolation.  Change func.chosen() from func1() to func2()
 ## and see the difference!

jj <- interpolant.quick(as.matrix(x), d.noisy, toy, scales=fish,
                        func=func.chosen, 
                         Ainv=Ainv,g=TRUE)

plot(x,jj$mstar.star,xlim=range(x),type="l",col="black",lwd=3)
lines(x,jj$prior,col="green",type="l")
lines(x,jj$mstar.star+jj$Z,type="l",col="red",lty=2)
lines(x,jj$mstar.star-jj$Z,type="l",col="red",lty=2)
points(toy,d.noisy,pch=16,cex=2)
legend("topright",lty=c(1,2,1,0),
    col=c("black","red","green","black"),pch=c(NA,NA,NA,16),
    legend=c("best estimate","+/-1 sd","prior","training set"))


  ## Now we will use O&O 2002.

## First, some simulated design points:
xdash <- as.matrix(c(-0.5, -0.1, -0.2, 1.1, 1.15))

## create an augmented design set:
design.augmented <- rbind(toy,xdash)

## And calculate the correlation matrix of the augmented dataset:
A.augmented <- corr.matrix(design.augmented, scales=fish)
Ainv.augmented <- solve(A.augmented)

## Now, define a function that samples from the
## appropriate posterior t-distribution, adds these random
## variables to the dataset, then calculates a new
## etahat and evaluates and plots it:

f <- function(...){

ddash <- cond.sample(n=1, x=xdash, xold=toy, d=d.noisy, A=A,
                           Ainv=Ainv, scales=fish, func=func.chosen)

        jj.aug <-
          interpolant.quick(x      = as.matrix(x),
                            d      = c(d.noisy,as.vector(ddash)),
                            xold   = design.augmented,
                            Ainv   = Ainv.augmented,
                            scales = fish,func=func.chosen)
points(xdash,ddash,type="p",pch=16,col="gray")
points(x, jj.aug, type="l", col="gray")
}


## Now execute the function a few times to assess the uncertainty in eta:
f()
f()
f()




