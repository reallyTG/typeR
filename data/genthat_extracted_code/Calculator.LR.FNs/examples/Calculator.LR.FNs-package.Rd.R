library(Calculator.LR.FNs)


### Name: Calculator.LR.FNs-package
### Title: Calculator for LR Fuzzy Numbers
### Aliases: Calculator.LR.FNs-package Calculator.LR.FNs
### Keywords: Calculator for LR Fuzzy Numbers Zadeh extension principle
###   Introducing the form of LR fuzzy number Fuzzy Number Introducing the
###   form of RL fuzzy number Fuzzy Number Introducing the form of L fuzzy
###   number Fuzzy Number Ploting and drawing LR fuzzy numbers Sign of LR
###   fuzzy number Support of LR fuzzy number Scalar multiplication on LR
###   fuzzy numbers Summation of two LR fuzzy numbers Subtraction of two LR
###   fuzzy numbers Product of two LR fuzzy numbers Division of two LR
###   fuzzy numbers

### ** Examples

# Example 1: mean of LR FNs
Left.fun  = function(x)  { (1-x)*(x>=0)}
A = L(6, 1, 2)
B = L(2, 4, 1)
LRFN.plot( A, xlim=c(-3,9), ylim=c(0,1.2), lwd=2, lty=2, col=2) 
LRFN.plot( B, lwd=2, lty=2, col=3, add=TRUE)
LRFN.plot(  s.m( 0.5 , s(A,B) ), lwd=2, lty=3, col=1, add=TRUE)
     # ploting the mean of A and B
legend( "topright", c("A = L(6, 1, 2)", "B = L(2, 4, 1)", "(A + B) / 2 = L(4, 2.5, 1.5)")
     , col = c(2, 3, 1), text.col = 1, lwd = c(2,2,2), lty = c(2, 2, 3) )

# Example 2: Compute and ploting  {0.5(A+B)}*A  where A and B are two LR FNs
LRFN.plot( A, xlim=c(-3,41), ylim=c(0,1), lwd=2, lty=2, col=2) 
LRFN.plot( B, lwd=2, lty=2, col=3, add=TRUE)
LRFN.plot( m( s.m( 0.5 , s(A,B) ) , A ) , lwd=2, lty=3, col=1
     , add=TRUE)  # ploting the mean of A and B
legend( "topright", c("A = L(6, 1, 2)", "B = L(2, 4, 1)", "{(A + B) / 2} * A = L(24, 19, 17)")
     , col = c(2, 3, 1), text.col = 1, lwd = c(2,2,2), lty = c(2, 2, 3) )

# Example 3: The mean of n=10 random LR fuzzy numbers
n = 10
Left.fun  = function(x)  { (1-x)*(x>=0)}
Right.fun = function(x)  { (exp(-x))*(x>=0)}
xlim=c(2, 18)
ylim=c(0, 1.15)
sum_x = c(0,0,0,0)

for (i in 1:n)
 {
  x = rnorm(1,10,3)
  x_l = runif(1,0,3)
  x_r = runif(1,0,2)
  X = c()
  X = LR(x, x_l, x_r)
  LRFN.plot( X, xlim=xlim, ylim=ylim, lwd=1, lty=1, col=1, add = (i != 1) )
  sum_x = a( sum_x , X )
 }

sum_x
X_bar = s.m( (1/n) , sum_x )
LRFN.plot( X_bar , lwd=2, lty=2, col=2, add = TRUE )
legend( "topright", c("LR FNs", "mean of LR FNs"), col = c(1, 2), text.col = 1
     , lwd = c(1, 2), lty = c(1, 2) )


# Example 4:
Left.fun = function(x)  { (1-x^2)*(x>=0)}
Right.fun = function(x)  { (1-x)*(x>=0)}

A = LR(2, 0.5, 1)
B = LR(1, 0.1, 0.6)
C = RL(3, 0.7, 1.5)
D = LR(3, 0.5, 0.3)

m(A,B)
s.m( 1.2 , m(A,B) )
d( s.m( 1.2 , m(A,B) ) , C)
m( d( s.m( 1.2 , m(A,B) ) , C) , D)

LRFN.plot( A, xlim=c(-0.2,6), ylim=c(0,1.75), lwd=2, lty=1, col=1) 
LRFN.plot( B, lwd=2, lty=1, col=2, add=TRUE)
LRFN.plot( C, lwd=2, lty=1, col=3, add=TRUE)
LRFN.plot( D, lwd=2, lty=1, col=4, add=TRUE)

LRFN.plot( m(A,B), lwd=2, lty=2, col=5, add=TRUE)
LRFN.plot( s.m( 1.2 , m(A,B) ), lwd=2, lty=3, col=6, add=TRUE)
LRFN.plot( d( s.m( 1.2 , m(A,B) ) , C), lwd=2, lty=4, col=7, add=TRUE)
LRFN.plot( m( d( s.m( 1.2 , m(A,B) ) , C) , D), lwd=2, lty=5, col=8, add=TRUE)

legend( "topright", c("A = LR(2, 0.5, 1)", "B = LR(1, 0.1, 0.6)", "C = RL(3, 0.7, 1.5)"
     , "D = LR(3, 0.5, 0.3)", "A * B = LR(2, 0.7, 2.2)", "1.2 (A * B) = LR(2.4, 0.84, 2.4)"
     , "{1.2 (A * B)} / C = LR(0.8, 0.68, 1.067)", "[{1.2 (A * B)} / C] * D = LR(2.4, 2.44, 3.44)")
     , col = c(1:8), text.col = 1, lwd = c(2,2,2,2,2,2,2,2), lty = c(1, 1, 1 ,1 , 2, 3, 4, 5) )


# Example 5:
Left.fun = function(x)  { (1-x^3)*(x>=0)}
Right.fun = function(x)  { (1-x)*(x>=0)}

A = LR(5, 0.5, 1)
B = LR(2, 0.3, 0.6)
C = RL(1, 0.7, 1.5)
D = LR(0.5, 0.5, 1)

E = s.m(a(A,B), 1/2) # The mean of A and B
F = s(s.m(a(A,B), 1/2), C)
G = m(F,D)

LRFN.plot( A, xlim=c(-1,6), ylim=c(0,1.5), lwd=3, lty=1, col=1) 
LRFN.plot( B, lwd=3, lty=1, col=2, add=TRUE)
LRFN.plot( C, lwd=3, lty=1, col=3, add=TRUE)
LRFN.plot( D, lwd=3, lty=1, col=4, add=TRUE)

LRFN.plot( E, lwd=3, lty=2, col=5, add=TRUE)
LRFN.plot( F, lwd=3, lty=3, col=6, add=TRUE)
LRFN.plot( G, lwd=3, lty=4, col=7, add=TRUE)

legend( "topleft", c("A = LR(5, 0.5, 1)", "B = LR(2, 0.3, 0.6)", "C = RL(1, 0.7, 1.5)",
   "D = LR(0.5, 0.5, 1)", "(A + B)/2 = LR(3.5, 0.4, 0.8)", "[(A + B)/2] - C = LR(2.5, 1.9, 1.5)",
   "{[(A + B)/2] - C} * D  = LR(1.25, 2.2, 3.2)" ),  col = c(1:7), text.col = 1, 
   lwd = c(2,2,2,2,2,2,2), lty = c(1, 1, 1, 1 , 2, 3, 4), bty = "n" )




