library(distr)


### Name: UnivarDistrList
### Title: Generating function for UnivarDistrList-class
### Aliases: UnivarDistrList
### Keywords: list distribution

### ** Examples

(DL <- UnivarDistrList(Norm(), Exp(), Pois()))
plot(DL)
as(Norm(), "UnivarDistrList")

## The function is currently defined as
function(...){ 
    new("UnivarDistrList", list(...)) 
}



