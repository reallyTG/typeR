library(rKIN)


### Name: calcOverlap
### Title: Calculate Percent Overlap of Isotopic Niche Space
### Aliases: calcOverlap

### ** Examples

library(rKIN)
data("rodents")
#estimate niche overlap between 2 species using kernel UD
test.kin<- estKIN(data=rodents, x="Ave_C", y="Ave_N", group="Species", 
                   levels=c(50, 75, 95), scaler=2)
#determine polygon overlap for all polygons
dat.olp<- calcOverlap(test.kin)



