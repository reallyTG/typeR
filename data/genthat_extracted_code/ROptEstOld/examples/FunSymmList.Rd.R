library(ROptEstOld)


### Name: FunSymmList
### Title: Generating function for FunSymmList-class
### Aliases: FunSymmList
### Keywords: robust

### ** Examples

FunSymmList(NonSymmetric(), EvenSymmetric(SymmCenter = 1), 
            OddSymmetric(SymmCenter = 2))

## The function is currently defined as
function (...){
    new("FunSymmList", list(...))
}



