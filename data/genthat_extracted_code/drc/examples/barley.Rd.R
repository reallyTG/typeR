library(drc)


### Name: leaflength
### Title: Leaf length of barley
### Aliases: leaflength
### Keywords: datasets

### ** Examples


## Fitting a hormesis model
leaflength.crs4c1 <- drm(DW ~ Dose, data = leaflength, fct = CRS.4c())
plot(fitted(leaflength.crs4c1), residuals(leaflength.crs4c1))

leaflength.crs4c2 <- boxcox(drm(DW ~ Dose, data = leaflength, fct = CRS.4c()), 
method = "anova", plotit = FALSE)
summary(leaflength.crs4c2)

## Plottinf fitted curve and original data
plot(leaflength.crs4c2, broken = TRUE, conLevel = 0.001, type = "all", legend = FALSE, 
ylab = "Produced leaf length (cm)", xlab = "Metsulfuron-methyl (mg/l)",
main = "Hormesis: leaf length of barley")




