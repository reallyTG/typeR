library(psych)


### Name: schmid
### Title: Apply the Schmid Leiman transformation to a correlation matrix
### Aliases: schmid
### Keywords: multivariate models

### ** Examples

jen <- sim.hierarchical()  #create a hierarchical demo
if(!require(GPArotation)) {
   message("I am sorry, you must have GPArotation installed to use schmid.")} else {
   p.jen <- schmid(jen,digits=2)   #use the oblimin rotation
p.jen <- schmid(jen,rotate="promax") #use the promax rotation
}



