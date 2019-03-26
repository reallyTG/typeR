library(Calculator.LR.FNs)


### Name: scalar multiplication
### Title: Scalar multiplication on LR fuzzy numbers
### Aliases: s.m
### Keywords: Calculator for LR Fuzzy Numbers Zadeh extension principle
###   Introducing the form of LR fuzzy number Fuzzy Number Introducing the
###   form of RL fuzzy number Fuzzy Number Introducing the form of L fuzzy
###   number Fuzzy Number Ploting and drawing LR fuzzy numbers Sign of LR
###   fuzzy number Support of LR fuzzy number Scalar multiplication on LR
###   fuzzy numbers Summation of two LR fuzzy numbers Subtraction of two LR
###   fuzzy numbers Product of two LR fuzzy numbers Division of two LR
###   fuzzy numbers

### ** Examples

# Example 1:
Left.fun  = function(x)  { (1-x)*(x>=0)}
Right.fun  = function(x)  { (1-x)*(x>=0)}
k = 2
M = LR(1, 0.6, 0.2)
N = L(3, 0.6, 1)
P = RL(5, 0.1, 0.3)
s.m(k, N)

# commutative property for scalar multiplication on LR fuzzy numbers (Jabejaei)
s.m(k, M)
s.m(M, k)

s.m(k, P)
s.m(-2, LR(4,2,1))

s.m(2, s.m(-2, LR(4,2,1)))

# Example 2:
Left.fun  = function(x)  { (1/(1+x^2))*(x>=0)}
Right.fun = function(x)  { (1/(1+(2*abs(x))))*(x>=0)}
A = RL(3,2,1)
LRFN.plot( A, xlim=c(-4,15), lwd=2, lty=2, col=2) 
LRFN.plot( s.m(0.5, A), lwd=2, lty=3, col=1, add=TRUE)
LRFN.plot( s.m(2, A), lwd=2, lty=4, col=1, add=TRUE)
legend( "topright", c("A = RL(3, 2, 1)", "0.5 A", "2 A"), col = c(2, 1, 1), text.col = 1
     , lwd = c(2,2,2), lty = c(2, 3, 4))


## The function is currently defined as
function (k, N) 
{
    if (messages(N) != 1) {
        return(messages(N))
    }
    if (messages(k) != 1) {
        return(messages(k))
    }
    if (length(k) == 4 & length(N) == 1) {
        zarf = N
        N[1] = k[1]
        N[2] = k[2]
        N[3] = k[3]
        N[4] = k[4]
        k = zarf
    }
    if (k == 0) {
        return(noquote(paste0(" The scalar multiplication is not defined for zero ")))
    }
    else {
        a1 = k * N[1]
        a2 = k * (N[2] * (k > 0) - N[3] * (k < 0))
        a3 = k * (N[3] * (k > 0) - N[2] * (k < 0))
        a4 = N[4]
        print(noquote(paste0("the result of scalar multiplication is  (core = ", 
            a1, ", left spread = ", a2, ", right spread = ", 
            a3, ")", if (a4 == 0) {
                paste0(" LR")
            }
            else if (a4 == 1) {
                paste0(" RL")
            }
            else {
                paste0(" L")
            })))
        return(invisible(c(a1, a2, a3, a4)))
    }
  }



