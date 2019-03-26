library(RandomFields)


### Name: RFhurst
### Title: Hurst coefficient
### Aliases: RFhurst
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample(reduced=50)
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## Don't show: 
.randomfields.options = options()$warn; options(warn=0)
## End(Don't show)
x <- runif(1000)
h <- RFhurst(1:length(x), data=x)
## Don't show: 
options(warn = .randomfields.options)
## End(Don't show)

## Don't show: 
FinalizeExample()
## End(Don't show)


