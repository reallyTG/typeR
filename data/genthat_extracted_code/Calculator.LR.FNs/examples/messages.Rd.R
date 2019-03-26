library(Calculator.LR.FNs)


### Name: messages
### Title: messages
### Aliases: messages
### Keywords: Calculator for LR Fuzzy Numbers

### ** Examples

messages("NOT additive")
messages( LR(3,1,1) )

## The function is currently defined as
function (M) 
{
    options(warn = -1)
    if (M[1] == "Addition has NOT a closed form of a LR fuzzy number") {
        return(noquote(paste0("Addition has NOT a closed form of a LR fuzzy number")))
    }
    else if (M[1] == "Subtraction has NOT a closed form of a LR fuzzy number") {
        return(noquote(paste0("Subtraction has NOT a closed form of a LR fuzzy number")))
    }
    else if (M[1] == "Production has NOT a closed form of a LR fuzzy number") {
        return(noquote(paste0("Production has NOT a closed form of a LR fuzzy number")))
    }
    else if (M[1] == "Division has NOT a closed form of a LR fuzzy number") {
        return(noquote(paste0("Division has NOT a closed form of a LR fuzzy number")))
    }
    else if (M[1] == " The fourth element of each LR fuzzy number must be 0 or 0.5 or 1! ") {
     return(noquote(paste0(" The fourth element of each LR fuzzy number must be 0 or 0.5 or 1! ")))
    }
    else if (M[1] == " The scalar multiplication is not defined for zero ") {
        return(noquote(paste0(" The scalar multiplication is not defined for zero ")))
    }
    else if (M[1] == 
"A regular approxi. is not defined for multiplication since at least one of FNs is non + and non -"
         ) {
        return(noquote(paste0(
"A regular approxi. is not defined for multiplication since at least one of FNs is non + and non -"
               )))
    }
    else if (M[1] == 
"A regular approximation is not defined for division since at least one of LR FNs is not positive"
         ) {
        return(noquote(paste0(
"A regular approximation is not defined for division since at least one of LR FNs is not positive"
               )))
    }
    else {
        return(1)
    }
  }



