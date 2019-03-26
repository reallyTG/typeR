library(DoE.wrapper)


### Name: bbd.design
### Title: Function for generating Box-Behnken designs
### Aliases: bbd.design
### Keywords: array design

### ** Examples

plan1 <- bbd.design(5)  ## default for 5 factors is unblocked design, contrary to package rsm
plan1
## blocked design for 4 factors, using default levels
plan2 <- bbd.design(4,block.name="block",default.levels=c(10,30))
plan2
desnum(plan2)
## design with factor.names and modified ncenter
bbd.design(3,ncenter=6, 
  factor.names=list("one"=c(25,35),"two"=c(-5,20), "three"=c(20,60)))
## design with character factor.names and default levels
bbd.design(3,factor.names=c("one","two", "three"), default.levels=c(10,20))



