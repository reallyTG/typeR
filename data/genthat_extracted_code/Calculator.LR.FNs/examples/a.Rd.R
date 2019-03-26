library(Calculator.LR.FNs)


### Name: addition
### Title: Addition of two LR fuzzy numbers
### Aliases: a
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
Left.fun  = function(x)  { (1/(1+x^2))*(x>=0)}
Right.fun = function(x)  { (1/(1+(2*abs(x))))*(x>=0)}
M = LR(1, 0.6, 0.2)
N = LR(3, 0.5, 1)
a(N, M)

# commutative property for addition on LR fuzzy numbers (Jabejaei)
P = RL(5, 0.1, 0.3)
a(N, P)
a(P, P)

# associative property for addition on LR fuzzy numbers (Sherekat-paziri)
a(N, a(M, M))
a(a(N, M), M)

# Example 2:
A = LR(2, 1, 3)
B = LR(3, 1.2, 1.8)
LRFN.plot( A, xlim=c(-3,12), ylim=c(0,1.25), lwd=2, lty=2, col=2) 
LRFN.plot( B, lwd=2, lty=1, col=5, add=TRUE)
LRFN.plot( a(A, B), lwd=2, col=1, add=TRUE)
legend( "topright", c("A = LR(2, 1, 3)", "B = LR(3, 1.2, 1.8)", "A + B = LR(5, 2.2, 4.8)")
     , col = c(2, 5, 1), text.col = 1, lwd = c(2,2,2), lty = c(2, 1, 1) )


## The function is currently defined as
function (M, N) 
{
    options(warn = -1)
    if (messages(M) != 1) {
        return(messages(M))
    }
    if (messages(N) != 1) {
        return(messages(N))
    }
    if (M[4] != N[4]) {
        return(noquote(paste0("Addition has NOT a closed form of a LR fuzzy number")))
    }
    else {
        a1 = M[1] + N[1]
        a2 = M[2] + N[2]
        a3 = M[3] + N[3]
        a4 = (M[4] + N[4])/2
        print(noquote(paste0("the result of addition is  (core = ", 
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



