library(rKIN)


### Name: getArea
### Title: Method to extract Niche Polygon Areas
### Aliases: getArea

### ** Examples

data("rodents")
#estimate niche overlap between 2 species using kernel UD
test.kin<- estKIN(data=rodents, x="Ave_C", y="Ave_N", group="Species", 
                 levels=c(50, 75, 95), scaler=2)
#determine polygon sizes/areas
kin.area<- getArea(test.kin)



