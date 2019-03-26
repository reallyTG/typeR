library(distrMod)


### Name: FunSymmList
### Title: Generating function for FunSymmList-class
### Aliases: FunSymmList
### Keywords: math

### ** Examples

FunSymmList(NonSymmetric(), EvenSymmetric(SymmCenter = 1), 
            OddSymmetric(SymmCenter = 2))

## The function is currently defined as
function (...){
    new("FunSymmList", list(...))
}



