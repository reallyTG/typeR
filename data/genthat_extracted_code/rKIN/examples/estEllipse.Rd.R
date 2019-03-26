library(rKIN)


### Name: estEllipse
### Title: Estimate Bivariate Normal Ellipse Isotope Niche
### Aliases: estEllipse

### ** Examples

library(rKIN)
data("rodents")
#estimate niche overlap between 2 species using bivariate ellipse
test.elp<- estEllipse(data=rodents, x="Ave_C", y="Ave_N", group="Species",
                     levels=c(50, 75, 95))
#determine polygon overlap for all polygons
plotKIN(test.elp, scaler=2, title="Ellipse Estimates", xlab="Ave_C", ylab="Ave_N")



