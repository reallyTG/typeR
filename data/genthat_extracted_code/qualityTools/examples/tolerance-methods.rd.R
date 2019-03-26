library(qualityTools)


### Name: tolerance-methods
### Title: Get and set methods
### Aliases: tolerance tolerance<- tolerance-methods
###   tolerance,gageRR-method tolerance<-,gageRR-method

### ** Examples

x = gageRRDesign(Operators = 3, Parts = 10, Measurements = 3)
#default 6tolerance
tolerance(x)   
#100 units                                               
tolerance(x) = 100                                            
tolerance(x)



