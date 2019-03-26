library(Calculator.LR.FNs)


### Name: multiplication
### Title: Product of two LR fuzzy numbers
### Aliases: m
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
Right.fun = function(x)  { (1/(1+(2*abs(x))))*(x>=0)}
A = LR(1, 0.6, 0.2)
B = LR(-3, 0.5, 1)
m(A, B)
m(B, A)
xlim = c(-5,4)
LRFN.plot( A, xlim=xlim, lwd=2, lty=2, col=2) 
LRFN.plot( B, lwd=2, lty=2, col=3, add=TRUE)
legend( "topright", c("A = LR(1, 0.6, 0.2)", "B = LR(-3, 0.5, 1)"), col = c(2, 3)
     , text.col = 1, lwd = c(2,2), lty = c(2, 2) )


# Example 2:
Left.fun  = function(x)  { (1-x)*(x>=0)}
Right.fun = function(x)  { (exp(-x))*(x>=0)}
A = LR(1.5, 1, 2)
B = LR(3, 2, 1)
LRFN.plot( A, xlim=c(-3,20), ylim=c(0,1), lwd=2, lty=2, col=2) 
LRFN.plot( B, lwd=2, lty=2, col=3, add=TRUE)
LRFN.plot( m(A,B), lwd=2, lty=3, col=1, add=TRUE)
legend( "topright", c("A = LR(1.5, 1, 2)", "B = LR(3, 2, 1)", "A * B = LR(4.5, 6, 7.5)")
     , col = c(2, 3, 1), text.col = 1, lwd = c(2,2,2), lty = c(2, 2, 3) )


# Example 3:
M = LR(1.2, 0.6, 0.2)
N = LR(3, 0.5, 1)

m(M,N)
m( LR(1.2, 0.6, 0.2) , LR(3, 0.5, 1) )

m(N,m(M,M))
m(m(N,M),M)

LRFN.plot( M, xlim=c(-2,10), ylim=c(0,1.4), lwd=2, lty=2, col=2) 
LRFN.plot( N, lwd=2, lty=2, col=3, add=TRUE)
LRFN.plot( m(M,N), lwd=2, lty=3, col=4, add=TRUE)
LRFN.plot( m(M,M), lwd=2, lty=4, col=5, add=TRUE)
LRFN.plot( m(m(N,M),M), lwd=2, lty=5, col=1, add=TRUE)
legend( "topright", c("M = LR(1.2, 0.6, 0.2)", "N = LR(3, 0.5, 1)", "M * N = LR(3.6, 2.4, 1.8)"
     , "M * M = LR(3.6, 2.4, 1.8)", "(N * M) * M = LR(4.32, 5.04, 2.88)"), col = c(2, 3, 4, 5, 1),
     text.col = 1, lwd = c(2,2,2,2,2), lty = c(2, 2, 3, 4, 5) )


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
        return(noquote(paste0("Production has NOT a closed form of a LR fuzzy number")))
    }
    else if ((sign(M) == "Positive") & (sign(N) == "Positive")) {
        a1 = M[1] * N[1]
        a2 = (M[1] * N[2]) + (N[1] * M[2])
        a3 = (M[1] * N[3]) + (N[1] * M[3])
        a4 = (M[4] + N[4])/2
        print(noquote(paste0("the result of multiplication is approximately  (core = ", 
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
    else if ((sign(M) == "Negative") & (sign(N) == "Negative")) {
        a1 = M[1] * N[1]
        a2 = -(M[1] * N[2]) - (N[1] * M[2])
        a3 = -(M[1] * N[3]) - (N[1] * M[3])
        a4 = abs(M[4] - 1)
        print(noquote(paste0("the result of multiplication is approximately  (core = ", 
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
    else if ((sign(M) == "Positive") & (sign(N) == "Negative")) {
        a1 = M[1] * N[1]
        a2 = (M[1] * N[2]) - (N[1] * M[3])
        a3 = (M[1] * N[3]) - (N[1] * M[2])
        a4 = abs(M[4] - 1)
        print(noquote(paste0("the result of multiplication is approximately  (core = ", 
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
    else if ((sign(M) == "Negative") & (sign(N) == "Positive")) {
        a1 = M[1] * N[1]
        a2 = (N[1] * M[2]) - (M[1] * N[3])
        a3 = (N[1] * M[3]) - (M[1] * N[2])
        a4 = abs(N[4] - 1)
        print(noquote(paste0("the result of multiplication is approximately  (core = ", 
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
    else {
        return(noquote(paste0(
"A regular approxi. is not defined for multiplication since at least one of FNs is non + and non -"
              )))
    }
  }



