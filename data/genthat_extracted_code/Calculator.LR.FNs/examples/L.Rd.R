library(Calculator.LR.FNs)


### Name: L
### Title: Introducing the form of L fuzzy number
### Aliases: L
### Keywords: Calculator for LR Fuzzy Numbers Zadeh extension principle
###   Introducing the form of LR fuzzy number Fuzzy Number Introducing the
###   form of RL fuzzy number Fuzzy Number Introducing the form of L fuzzy
###   number Fuzzy Number Ploting and drawing LR fuzzy numbers

### ** Examples

# First introduce the left shape function of L fuzzy number
Left.fun  = function(x)  { (1-x^2)*(x>=0)}
A = L(20, 12, 10)
LRFN.plot(A, xlim=c(0,60), col=2, lwd=2)

## The function is currently defined as
function (m, m_l, m_r) 
{
    c(m, m_l, m_r, 0.5)
  }



