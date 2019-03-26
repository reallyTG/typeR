library(hoa)


### Name: tem
### Title: Tangent exponential model: Higher Order Likelihood Approximation
### Aliases: tem fraser.reid
### Keywords: models htest

### ** Examples

# Cost data example from Section 3.5 of "Applied Asymptotics"	
cost <- data.frame(
          f = factor( c(rep(1,13), rep(2,18)) ),
          y = c( 30,172,210,212,335,489,651,1263,1294,1875,2213,2998, 
                 4935,121,172,201,214,228,261,278,279,351,561,622,
                 694,848,853,1086,1110,1243,2543 ) )  
nlogL <- function(psi, lam, data)  { 
  s1 <- exp(lam[2])
  m2 <- lam[1]
  s2 <- exp(lam[3])
  m1 <- psi + m2 + s2^2/2 - s1^2/2
  -sum( dnorm(log(data$y), mean=ifelse(data$f==1, m1, m2),
  	                sd=ifelse(data$f==1, s1, s2), log=TRUE) )
}
phi <- function(th, V, data)  {
  psi <- th[1]
  lam <- th[-1]
  s1 <- exp(lam[2])
  m2 <- lam[1]
  s2 <- exp(lam[3])
  m1 <- psi + m2 + s2^2/2 - s1^2/2
  c( m1/s1^2, 1/s1^2, m2/s2^2, 1/s2^2 ) 
}
make.V <- function(th, data) NULL
cost.lnorm.rat <- tem(psi = NULL, nlogL = nlogL, phi = phi, 
                    make.V = make.V, th.init = c(0, 5, 2, 5), data = cost)
plot(cost.lnorm.rat, psi = 0, all = TRUE)
summary(cost.lnorm.rat)



