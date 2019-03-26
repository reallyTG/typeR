library(dst)


### Name: bcaRel
### Title: Representation of a mass function in a product space
### Aliases: bcaRel

### ** Examples

# A logical implication rule
# A typical relation between two variables in the context of expert systems is the
# logical implication \code{(a -> b)}. Let us suppose
# that \code{a} stands for \code{Rain: {yes, no}} and \code{b} stands for
# \code{RoadWorks: {yes, no}}. From experience,
# I am 75 % sure that there will be RoadWorks if there is no rain.
## 1. The tt table of the logical implication
 ttrwf <- matrix(c(0,1,1,0,1,0,1,0,1,0,0,1,1,1,1,1),
 nrow=4, byrow = TRUE, 
 dimnames = list(NULL, c("rWdy", "rWdn", "Ry", "Rn")) )
 ## The mass distribution
 specrw <-  matrix(c(1,1,1,2,0.75,0.75,0.75,0.25), ncol = 2, 
 dimnames = list(NULL, c("specnb", "mass"))) 
 ## Variables numbers and sizes
 inforw <- matrix(c(4,5,2,2), ncol = 2, 
 dimnames = list(NULL, c("varnb", "size")) )
bcaRel(tt = ttrwf, spec = specrw, infovar = inforw,
 infovarnames = c("RdWorks", "Rain"), relnb = 6)
 



