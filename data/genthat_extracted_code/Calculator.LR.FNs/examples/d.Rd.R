library(Calculator.LR.FNs)


### Name: division
### Title: Division of two LR fuzzy numbers
### Aliases: d
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
A = L(6, 1, 2)
B = L(3, 2, 3)
xlim=c(-1.5,9)
LRFN.plot( A, xlim=xlim, lwd=2, lty=2, col=2) 
LRFN.plot( B, lwd=2, lty=2, col=3, add=TRUE)
LRFN.plot( d(A,B), lwd=2, lty=1, col=1, add=TRUE)
legend( "topright", c("A = L(6, 1, 2)", "B = L(3, 2, 3)", "A / B = L(2, 2.33, 2)")
     , col = c(2, 3, 1), text.col = 1, lwd = c(2,2,2), lty = c(2, 2, 1) )


# Example 2:
Left.fun  = function(x)  { (1-x)*(x>=0)}
Right.fun = function(x)  { (1-x^2)*(x>=0)}
A = LR(8, 0.5, 1)
B = RL(2, 1, 1.5)

d(A,B)
d(LR(8, 0.5, 1), RL(2, 1, 1.5))

d(A,A)

d(d(A,B),B)
d(A,d(B,B))

C = LR(-3, 0.5, 1)
d(A,C)
LRFN.plot( A, xlim=c(-3,9.5), lwd=2, lty=2, col=2) 
LRFN.plot( B, lwd=2, lty=2, col=3, add=TRUE)
LRFN.plot( d(A,B), lwd=2, lty=3, col=4, add=TRUE)
LRFN.plot( d(d(A,B),B), lwd=2, lty=4, col=1, add=TRUE)
legend( "topleft", c("A = LR(8, 0.5, 1)", "B = RL(2, 1, 1.5)", "A / B = LR(4, 3.25, 2.5)"
     , "(A / B) / B = LR(2, 3.125, 2.25)"), col = c(2, 3, 4, 1), text.col = 1, lwd = c(2,2,2)
     , lty = c(2, 2, 3, 4) )


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
        if ((sign(M) == "Positive") & (sign(N) == "Positive")) {
            a1 = M[1]/N[1]
            a2 = ((M[1] * N[3]) + (N[1] * M[2]))/(N[1]^2)
            a3 = ((M[1] * N[2]) + (N[1] * M[3]))/(N[1]^2)
            a4 = M[4]
            print(noquote(paste0("the result of division is approximately  (core = ", 
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
"A regular approximation is not defined for division since at least one of LR FNs is not positive"
                )))
        }
    }
    else {
        return(noquote(paste0("Division has NOT a closed form of a LR fuzzy number")))
    }
  }



