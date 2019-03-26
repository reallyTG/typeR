library(Calculator.LR.FNs)


### Name: sign
### Title: Sign of LR fuzzy number
### Aliases: sign
### Keywords: Calculator for LR Fuzzy Numbers Introducing the form of LR
###   fuzzy number Fuzzy Number Introducing the form of RL fuzzy number
###   Fuzzy Number Introducing the form of L fuzzy number Fuzzy Number
###   Ploting and drawing LR fuzzy numbers Sign of LR fuzzy number Support
###   of LR fuzzy number Product of two LR fuzzy numbers Division of two LR
###   fuzzy numbers

### ** Examples

Left.fun  = function(x)  { (1-x)*(x>=0)}

M = L(2,4,3)
support(M)
sign(M)

sign( L(5,4,3) )

( sign( L(5,4,3) ) == "Positive" )

## The function is currently defined as
function (M) 
{
    supp = support(M)
    if (supp[1] > 0) {
        return(noquote(paste0("Positive")))
    }
    else {
        if (supp[2] < 0) {
            return(noquote(paste0("Negative")))
        }
        else {
            return(noquote(paste0("non-positive and non negative")))
        }
    }
  }



