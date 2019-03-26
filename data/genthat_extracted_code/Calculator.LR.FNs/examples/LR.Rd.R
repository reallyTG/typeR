library(Calculator.LR.FNs)


### Name: LR
### Title: Introducing the form of LR fuzzy number
### Aliases: LR
### Keywords: Calculator for LR Fuzzy Numbers Zadehs extension principle
###   Introducing the form of LR fuzzy number Fuzzy Number Introducing the
###   form of RL fuzzy number Fuzzy Number Introducing the form of L fuzzy
###   number Fuzzy Number Ploting and drawing LR fuzzy numbers

### ** Examples

# First introduce left and right shape functions of LR fuzzy number
Left.fun  = function(x)  { (1-x^2)*(x>=0)}
Right.fun = function(x)  { (exp(-x))*(x>=0)}
A = LR(20, 12, 10)
LRFN.plot(A, xlim=c(0,60), col=1)

## The function is currently defined as
function (m, m_l, m_r) 
{
    c(m, m_l, m_r, 0)
  }



