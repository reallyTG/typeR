library(distr)


### Name: DistrList
### Title: Generating function for DistrList-class
### Aliases: DistrList
### Keywords: distribution list

### ** Examples

(DL <- DistrList(Norm(), Exp(), Pois()))
plot(DL)
as(Norm(), "DistrList")

## The function is currently defined as
function(...){ 
    new("DistrList", list(...)) 
}



