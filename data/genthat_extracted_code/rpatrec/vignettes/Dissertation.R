## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(rpatrec)
library(np)
library(stats)

## ---- fig.show='hold'----------------------------------------------------
a <- generator()
plot(a, type="l", ylab="price", xlab="Trading Days", main="HS")
b <- generator(plength=5,parts=c(0,15,30,50,70,85,100),sprd=c(0,-40,-20,-100,-20,-40,0))
plot(b, type="l", ylab="price", xlab="Trading Days", main = "Inverse HS")

## ---- fig.show='hold'----------------------------------------------------
#Double Tops
c <- generator(plength=3,parts=c(0,25,50,75,100),sprd=c(0,80,40,80,0))
plot(a, type="l", ylab="price", xlab="Trading Days", main="Double Tops")
#Rectangle Tops
d <- generator(plength=5,parts=c(0,20,40,50,60,80,100),sprd=c(0,80,40,80,40,80,0))
plot(d, type="l", ylab="price", xlab="Trading Days", main = "Rectangle Tops")
#Triangle Tops
e <- generator(plength=5,parts=c(0,15,30,50,70,85,100),sprd=c(0,100,10,60,20,30,0))
plot(e, type="l", ylab="price", xlab="Trading Days", main = "Triangle Tops")
#Broadening Tops
f <- generator(plength=5,parts=c(0,15,30,50,70,85,100),sprd=c(0,30,20,60,10,100,0))
plot(f, type="l", ylab="price", xlab="Trading Days", main = "Broadening Tops")

## ---- fig.show='hold'----------------------------------------------------
interpret(f)


## ---- fig.show='hold'----------------------------------------------------
#Number of runs
noruns <- 1
#define the pattern specifications:
specs <- list(c(0,15,30,50,70,85,100),c(0,15,30,50,70,85,100),c(0,20,40,50,60,80,100)
              ,c(0,25,50,75,100),c(0,15,30,50,70,85,100))
spreads <- list(c(0,40,20,100,20,40,0),c(0,30,20,60,10,100,0),c(0,80,40,80,40,80,0)
                ,c(0,80,40,80,0),c(0,100,10,60,20,30,0))
points <- c(5,5,5,3,5)
test1 <- vector()
#run the test for all specifications, 25 times each:
for(i in 1:5){
  curspec <- specs[[i]]
  cursprd <- spreads[[i]]
  curp <- points [i]
  success <- 0
  for(j in 1:noruns){
    curg <- generator(plength = curp, parts = curspec, sprd = cursprd)
    cur <- interpret(curg)
    #check whether the first recognised extreme is in order and whether the number of extremes is in order
    k <- i
    if(i==5)k <- 2 
    if(cur[[k+3]][[1]][1] > cursprd[2]*0.95 && cur[[k+3]][[1]][1] < cursprd[2]*1.05){
      if(length(cur[[1]])==curp)success <- success + 1
    }
  }
  test1[i] <- success / noruns * 100
}
#the following line returns the recognition results in %
print(test1)

## ---- fig.show='hold'----------------------------------------------------
exp1 <- generator()
#white noise
exp2 <- noise(exp1,"white",5)
exp3 <- kernel(exp2,3)
plot(exp1, type="l", ylab="price", xlab="Trading Days", main="HS")
plot(exp2, type="l", ylab="price", xlab="Trading Days", main="HS with white noise, sd=5")
plot(exp3, type="l", ylab="price", xlab="Trading Days", main="HS with white noise, sd=5, smoothed with kernel regression")


## ---- fig.show='hold'----------------------------------------------------
interpret(exp2)

## ---- fig.show='hold'----------------------------------------------------
#dummy variable for n
r <- 1
#dummy variable for m
s <- 3

## ---- fig.show='hold'----------------------------------------------------
a <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = kernel,bandwidth=1)
b <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = kernel,bandwidth=2)
c <- test.smoother(n=r,m=s,incr=0.5,max=80,smoother = kernel,bandwidth=3)
d <- test.smoother(n=r,m=s,incr=0.5,max=80,smoother = kernel,bandwidth=4)
#attach(mtcars)
#par(mfrow=c(2,2))
plot(a, type="l", ylab="% of patterns recognised", xlab="noise", main="Bandwidth = 1")
plot(b, type="l", ylab="% of patterns recognised", xlab="noise", main="Bandwidth = 2")
plot(c, type="l", ylab="% of patterns recognised", xlab="noise", main="Bandwidth = 3")
plot(d, type="l", ylab="% of patterns recognised", xlab="noise", main="Bandwidth = 4")
#detach(mtcars)

## ---- fig.show='hold'----------------------------------------------------
a <- test.smoother(n=r,m=s,incr=0.5,max=80,smoother = kernel,bandwidth=5)
b <- test.smoother(n=r,m=s,incr=0.5,max=80,smoother = kernel,bandwidth=6)
c <- test.smoother(n=r,m=s,incr=0.5,max=80,smoother = kernel,bandwidth=7)
d <- test.smoother(n=r,m=s,incr=0.5,max=80,smoother = kernel,bandwidth=8)
#attach(mtcars)
#par(mfrow=c(2,2))
plot(a, type="l", ylab="% of patterns recognised", xlab="noise", main="Bandwidth = 5")
plot(b, type="l", ylab="% of patterns recognised", xlab="noise", main="Bandwidth = 6")
plot(c, type="l", ylab="% of patterns recognised", xlab="noise", main="Bandwidth = 7")
plot(d, type="l", ylab="% of patterns recognised", xlab="noise", main="Bandwidth = 8")
#detach(mtcars)

## ---- fig.show='hold'----------------------------------------------------
a <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = savgolay,width = 7)
b <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = savgolay,width = 8)
c <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = savgolay,width = 9)
d <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = savgolay,width = 10)
e <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = savgolay,width = 11)
f <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = savgolay,width = 12)
#attach(mtcars)
#par(mfrow=c(3,2))
plot(a, type="l", ylab="% of patterns recognised", xlab="noise", main="Width = 7, Degree = 2")
plot(b, type="l", ylab="% of patterns recognised", xlab="noise", main="Width = 8, Degree = 2")
plot(c, type="l", ylab="% of patterns recognised", xlab="noise", main="Width = 9, Degree = 2")
plot(d, type="l", ylab="% of patterns recognised", xlab="noise", main="Width = 10, Degree = 2")
plot(e, type="l", ylab="% of patterns recognised", xlab="noise", main="Width = 11, Degree = 2")
plot(f, type="l", ylab="% of patterns recognised", xlab="noise", main="Width = 12, Degree = 2")
#detach(mtcars)

## ---- fig.show='hold'----------------------------------------------------
a <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = savgolay, width = 10, degree = 1)
b <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = savgolay, width = 10, degree = 2)
c <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = savgolay, width = 10, degree = 3)
d <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = savgolay, width = 10, degree = 4)
#attach(mtcars)
#par(mfrow=c(2,2))
plot(a, type="l", ylab="% of patterns recognised", xlab="noise", main="Width = 10, Degree = 1")
plot(b, type="l", ylab="% of patterns recognised", xlab="noise", main="Width = 10, Degree = 2")
plot(c, type="l", ylab="% of patterns recognised", xlab="noise", main="Width = 10, Degree = 3")
plot(d, type="l", ylab="% of patterns recognised", xlab="noise", main="Width = 10, Degree = 4")
#detach(mtcars)

## ---- fig.show='hold'----------------------------------------------------
a <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = mav, len = 5, method = "simple")
b <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = mav, len = 10, method = "simple")
c <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = mav, len = 15, method = "simple")
d <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = mav, len = 20, method = "simple")
#attach(mtcars)
#par(mfrow=c(2,2))
plot(a,type = "l", ylab="% of patterns recognised", xlab="noise", main="SMA, length = 5")
plot(b,type = "l", ylab="% of patterns recognised", xlab="noise", main="SMA, length = 10")
plot(c,type = "l", ylab="% of patterns recognised", xlab="noise", main="SMA, length = 15")
plot(d,type = "l", ylab="% of patterns recognised", xlab="noise", main="SMA, length = 20")
#detach(mtcars)

## ---- fig.show='hold'----------------------------------------------------
a <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = mav, len = 5, method = "median")
b <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = mav, len = 10, method = "median")
c <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = mav, len = 15, method = "median")
d <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = mav, len = 20, method = "median")
#attach(mtcars)
#par(mfrow=c(2,2))
plot(a,type = "l", ylab="% of patterns recognised", xlab="noise", main="Moving Median, length = 5")
plot(b,type = "l", ylab="% of patterns recognised", xlab="noise", main="Moving Median, length = 10")
plot(c,type = "l", ylab="% of patterns recognised", xlab="noise", main="Moving Median, length = 15")
plot(d,type = "l", ylab="% of patterns recognised", xlab="noise", main="Moving Median, length = 20")
#detach(mtcars)

## ---- fig.show='hold'----------------------------------------------------
a <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = splines, spar=0.1)
b <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = splines, spar=0.3)
c <- test.smoother(n=r,m=s,incr=0.5,max=60,smoother = splines, spar=0.5)
d <- test.smoother(n=r,m=s,incr=0.5,max=110,smoother = splines, spar=0.7)
#attach(mtcars)
#par(mfrow=c(2,2))
plot(a,type = "l", ylab="% of patterns recognised", xlab="noise", main="Smoothing Splines, spar = 0.1")
plot(b,type = "l", ylab="% of patterns recognised", xlab="noise", main="Smoothing Splines, spar = 0.3")
plot(c,type = "l", ylab="% of patterns recognised", xlab="noise", main="Smoothing Splines, spar = 0.5")
plot(d,type = "l", ylab="% of patterns recognised", xlab="noise", main="Smoothing Splines, spar = 0.7")
#detach(mtcars)

## ---- fig.show='hold'----------------------------------------------------
a <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = loess.rpatrec, span=0.1)
b <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = loess.rpatrec, span=0.2)
c <- test.smoother(n=r,m=s,incr=0.5,max=70,smoother = loess.rpatrec, span=0.3)
d <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = loess.rpatrec, span=0.4)
#attach(mtcars)
#par(mfrow=c(2,2))
plot(a,type = "l", ylab="% of patterns recognised", xlab="noise", main="LOESS, span = 0.1")
plot(b,type = "l", ylab="% of patterns recognised", xlab="noise", main="LOESS, span = 0.2")
plot(c,type = "l", ylab="% of patterns recognised", xlab="noise", main="LOESS, span = 0.3")
plot(d,type = "l", ylab="% of patterns recognised", xlab="noise", main="LOESS, span = 0.4")
#detach(mtcars)

## ---- fig.show='hold'----------------------------------------------------
a <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = kernel,ntype = "white", bandwidth=3)
b <- test.smoother(n=r,m=s,incr=0.5,max=50,smoother = kernel,ntype = "red", bandwidth=3)

#attach(mtcars)
#par(mfrow=c(2,2))
plot(a, type="l", ylab="% of patterns recognised", xlab="noise", main="White Noise")
plot(b, type="l", ylab="% of patterns recognised", xlab="noise", main="Red Noise")

#detach(mtcars)

