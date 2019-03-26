library(Calculator.LR.FNs)


### Name: subtraction
### Title: Subtraction of two LR fuzzy numbers
### Aliases: s
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
N = RL(3, 0.5, 1)

s(N, M)
s(M, N)
s(M, M)
s(s(N, M), M)

# Example 2:
Left.fun  = function(x)  { (1-x)*(x>=0)}
A = L(5,3,2)
B = L(3,2,1)
LRFN.plot( A, xlim=c(-3,12), lwd=2, lty=2, col=2) 
LRFN.plot( B, lwd=2, lty=2, col=3, add=TRUE)
LRFN.plot( s(A, B), lwd=2, lty=3, col=1, add=TRUE)
legend( "topright", c("A = L(5, 3, 2)", "B = L(3, 2, 1)", "A - B = L(2, 4, 4)"), col = c(2, 3, 1)
     , text.col = 1, lwd = c(2,2,2), lty = c(2, 2, 3) )

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
    if ((M[4] == 1 & N[4] == 0) | (M[4] == 0 & N[4] == 1) | (M[4] == 
        0.5 & N[4] == 0.5)) {
        a1 = M[1] - N[1]
        a2 = M[2] + N[3]
        a3 = M[3] + N[2]
        a4 = M[4]
        print(noquote(paste0("the result of subtraction is  (core = ", 
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
        return(noquote(paste0( "Subtraction has NOT a closed form of a LR fuzzy number" )))
    }
  }



