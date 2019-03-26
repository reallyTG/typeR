library(Calculator.LR.FNs)


### Name: LRFN.plot
### Title: Plotting and drawing LR fuzzy numbers
### Aliases: LRFN.plot
### Keywords: Calculator for LR Fuzzy Numbers Introducing the form of LR
###   fuzzy number Fuzzy Number Introducing the form of RL fuzzy number
###   Fuzzy Number Introducing the form of L fuzzy number Fuzzy Number
###   Ploting and drawing LR fuzzy numbers Scalar multiplication on LR
###   fuzzy numbers Summation of two LR fuzzy numbers Subtraction of two LR
###   fuzzy numbers Product of two LR fuzzy numbers Division of two LR
###   fuzzy numbers

### ** Examples

# Example 1:
# First introduce left-side and right-side functions of LR fuzzy number
Left.fun  = function(x)  { (1-x^2)*(x>=0)}
Right.fun = function(x)  { (exp(-x))*(x>=0)}
A = LR(20, 12, 10)
LRFN.plot(A, xlim=c(0,60), col=1)
LRFN.plot(A, lty=2, lwd=3, col=2, add=TRUE)


# Example 2:
# for first LR fuzzy number:
Left.fun  = function(x)  { (1-x^2)*(x>=0)}
Right.fun = function(x)  { (exp(-x))*(x>=0)}
LRFN.plot( LR(17,5,3), xlim=c(5,40), lwd=2, lty=2, col=2) 

# for second LR fuzzy number:
Left.fun  = function(x)  { (1/(1+x^2))*(x>=0)}
Right.fun = function(x)  { (1/(1+(2*abs(x))))*(x>=0)}
LRFN.plot( RL(20,2,3), lwd=2, col=1, add=TRUE)

# for third LR fuzzy number:
Left.fun  = function(x)  { (1-x)*(x>=0)}
LRFN.plot( L(30,15,5), lwd=2, lty=3, col=4, add=TRUE)
legend( "topright", c("LR(17, 5, 3)", "RL(20, 2, 3)", "L(30, 15, 5)"), col = c(2, 1, 4)
     , text.col = 1, lwd = c(2,2,2), lty = c(2, 1, 3) )


## The function is currently defined as
function (M, Left.fun = NULL, Right.fun = NULL, ...) 
{
if ( messages(M) != 1 )  { return( messages(M) ) }

m = M[1]
m_l = M[2]
m_r = M[3]

x <- NULL

if ( M[4] == 0 ) { y = function(x) Left.fun((m-x)/m_l) * (x<=m) + Right.fun((x-m)/m_r) * (m<x) }
 else if (M[4]==1) { y = function(x) Right.fun((m-x)/m_l) * (x<=m) + Left.fun((x-m)/m_r) * (m<x) }
 else if (M[4]==0.5) { y = function(x) Left.fun((m-x)/m_l) * (x<=m) + Left.fun((x-m)/m_r) * (m<x)}
 else{return(noquote(paste0("The fourth element of each LR fuzzy number must be 0 or 0.5 or 1!")))}

return( curve(y(x) * (0<=y(x) & y(x)<=1), ...) )
 }



