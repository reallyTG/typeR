library(gplm)


### Name: kgplm
### Title: Generalized partial linear model
### Aliases: kgplm
### Keywords: smooth

### ** Examples

  ## data
  n <- 1000; b <- c(1,-1); rho <- 0.7
  m <- function(t){ 1.5*sin(pi*t) }
  x1 <- runif(n,min=-1,max=1); u  <- runif(n,min=-1,max=1)
  t  <- runif(n,min=-1,max=1); x2 <- round(m(rho*t + (1-rho)*u))
  x  <- cbind(x1,x2)
  y  <- x %*% b + m(t) + rnorm(n)

  ## partial linear model (PLM)
  gh <- kgplm(x,t,y,h=0.25,family="gaussian",link="identity")
  o <- order(t)
  plot(t[o],m(t[o]),type="l",col="green")
  lines(t[o],gh$m[o]); rug(t)

  ## partial linear probit model (GPLM)
  y <- (y>0)
  gh <- kgplm(x,t,y,h=0.25,family="bernoulli",link="probit")

  o <- order(t)
  plot(t[o],m(t[o]),type="l",col="green")
  lines(t[o],gh$m[o]); rug(t)

  ## data with two-dimensional m-function 
  n <- 1000; b <- c(1,-1); rho <- 0.7
  m <- function(t1,t2){ 1.5*sin(pi*t1)+t2 }
  x1 <- runif(n,min=-1,max=1); u  <- runif(n,min=-1,max=1)
  t1 <- runif(n,min=-1,max=1); t2 <- runif(n,min=-1,max=1)
  x2 <- round( m( rho*t1 + (1-rho)*u , t2 ) )
  x  <- cbind(x1,x2); t  <- cbind(t1,t2)
  y  <- x %*% b + m(t1,t2) + rnorm(n)

  ## partial linear model (PLM)
  grid1 <- seq(min(t[,1]),max(t[,1]),length=20)
  grid2 <- seq(min(t[,2]),max(t[,2]),length=25)
  grid  <- create.grid(list(grid1,grid2))

  gh <- kgplm(x,t,y,h=0.5,grid=grid,family="gaussian",link="identity")

  o <- order(grid[,2],grid[,1])
  est.m  <- (matrix(gh$m.grid[o],length(grid1),length(grid2)))
  orig.m <- outer(grid1,grid2,m)
  par(mfrow=c(1,2))
  persp(grid1,grid2,orig.m,main="Original Function",
        theta=30,phi=30,expand=0.5,col="lightblue",shade=0.5)
  persp(grid1,grid2,est.m,main="Estimated Function",
        theta=30,phi=30,expand=0.5,col="lightblue",shade=0.5)
  par(mfrow=c(1,1))



