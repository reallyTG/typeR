library(distrEx)


### Name: EuclCondition
### Title: Generating function for EuclCondition-class
### Aliases: EuclCondition
### Keywords: distribution

### ** Examples

EuclCondition(dimension = 3)

## The function is currently defined as
function(dimension){
    new("EuclCondition", Range = EuclideanSpace(dimension = dimension))
}



