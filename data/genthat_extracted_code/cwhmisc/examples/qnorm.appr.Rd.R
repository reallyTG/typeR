library(cwhmisc)


### Name: qnorm.appr
### Title: Approximation to the inverse normal distribution function.
### Aliases: qnorm.ap16 qnorm.app4 qnorm.app3
### Keywords: distribution

### ** Examples

  prec <- function(x,y,z=y) max(abs((x-y)/z)) # relative precision
  x2 <- -0.6744897501960817; p2 <- 0.25
  x0 <- -3.090232306167814;  p0 <- 0.001
  xm <- -9.262340089798408;  pm <- 1.0e-20
  x  <- c((-100:0)/10,x2,x0,xm)
  p  <- pnorm(x)
  x3 <- qnorm.app3(p)
  x4 <- qnorm.app4(p)
  x1 <- qnorm.ap16(p)
# Check relative precision of approximations
  prec(x,x3,1)  # 0.002817442
  prec(x,x4,1)  # 0.0004435874
  prec(x,x1,1)  # 0.1571311 why so bad ?
  prec(x,qnorm(p),1)  # 1.776357e-15
# Special values
  prec(qnorm.app3(p2),x2)  # 0.004089976
  prec(qnorm.app3(p0),x0)  # 0.0007736497
  prec(qnorm.app3(pm),xm)  # 7.29796e-06
  prec(qnorm.app4(p2),x2)  # 0.0004456853
  prec(qnorm.app4(p0),x0)  # 9.381806e-05
  prec(qnorm.app4(pm),xm)  # 4.151165e-05
  prec(qnorm.ap16(p2),x2)  # 0
  prec(qnorm.ap16(p0),x0)  # 2.874148e-16
  prec(qnorm.ap16(pm),xm)  # 0.01211545
  



