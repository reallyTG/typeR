library(ROptRegTS)


### Name: CondIC
### Title: Generating function for CondIC-class
### Aliases: CondIC
### Keywords: robust

### ** Examples

CondIC()

## The function is currently defined as
function(name, Curve = EuclRandVariable(Map = list(function(x){x[1]*x[2]}),
                             Domain = EuclideanSpace(dimension = 2)),
         Risks, Infos, CallL2Fam = call("L2RegTypeFamily")){
    if(missing(name))
        name <- "Influence curve for a L_2 differentiable regression type family"
    if(missing(Risks))
        Risks <- list()
    if(missing(Infos))
        Infos <- matrix(c(character(0),character(0)), ncol=2,
                     dimnames=list(character(0), c("method", "message")))
    return(new("CondIC", name = name, Curve = Curve, Risks = Risks,
               Infos = Infos, CallL2Fam = CallL2Fam))
  }



