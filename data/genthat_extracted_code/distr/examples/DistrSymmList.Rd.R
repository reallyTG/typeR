library(distr)


### Name: DistrSymmList
### Title: Generating function for DistrSymmList-class
### Aliases: DistrSymmList
### Keywords: distribution

### ** Examples

DistrSymmList(NoSymmetry(), SphericalSymmetry(SymmCenter = 1), 
              EllipticalSymmetry(SymmCenter = 2))

## The function is currently defined as
function (...){
    new("DistrSymmList", list(...))
}



