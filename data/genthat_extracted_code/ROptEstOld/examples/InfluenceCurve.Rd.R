library(ROptEstOld)


### Name: InfluenceCurve
### Title: Generating function for InfluenceCurve-class
### Aliases: InfluenceCurve
### Keywords: robust

### ** Examples

InfluenceCurve()

## The function is currently defined as
InfluenceCurve <- function(name, Curve = EuclRandVarList(EuclRandVariable(Domain = Reals())), 
                           Risks, Infos){
    if(missing(name))
        name <- "influence curve"
    if(missing(Risks))
        Risks <- list()
    if(missing(Infos))
        Infos <- matrix(c(character(0),character(0)), ncol=2,
                     dimnames=list(character(0), c("method", "message")))
    
    return(new("InfluenceCurve", name = name, Curve = Curve, 
               Risks = Risks, Infos = Infos))
}



