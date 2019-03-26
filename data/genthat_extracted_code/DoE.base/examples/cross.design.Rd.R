library(DoE.base)


### Name: cross.design
### Title: Function to cross several designs
### Aliases: cross.design
### Keywords: array design

### ** Examples

   ## creating a Taguchi-style inner-outer array design
   ## with proper randomization
   ##   function param.design would generate such a design with all outer array runs 
   ##     for each inner array run conducted in sequence
   ##   alternatively, a split-plot approach can also handle control and noise factor 
   ##     designs without necessarily crossing two separate designs
   des.control <- oa.design(ID=L18)
   des.noise <- oa.design(ID=L4.2.3,nlevels=2,factor.names=c("N1","N2","N3"))
   crossed <- cross.design(des.control, des.noise)
   crossed
   summary(crossed)



