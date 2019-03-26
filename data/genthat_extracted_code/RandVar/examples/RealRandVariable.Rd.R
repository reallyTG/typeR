library(RandVar)


### Name: RealRandVariable
### Title: Generating function for RealRandVariable-class
### Aliases: RealRandVariable
### Keywords: classes

### ** Examples

RealRandVariable(Map = list(function(x){x}), Domain = Reals())

## The function is currently defined as
function(Map = list(function(x){1}), Domain = NULL, Range) {
    if(missing(Range)) Range <- Reals()
    if(!is(Range, "Reals"))
        stop("'Range' has to be of class 'Reals'")

    return(new("RealRandVariable", Map = Map, 
               Domain = Domain, Range = Reals()))
}



