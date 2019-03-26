library(rKIN)


### Name: plotKIN
### Title: Plotting function for rKIN polygons
### Aliases: plotKIN

### ** Examples

library(rKIN)
data("rodents")
#estimate niche overlap between 2 species using kernel UD
test.kin<- estKIN(data=rodents, x="Ave_C", y="Ave_N", group="Species",
                   levels=c(50, 75, 95), scaler=2)
#determine polygon overlap for all polygons
plotKIN(test.kin, scaler = 1, title = "Kernel Estimates",
         xlab = expression({delta}^13*C~ ('\u2030')),
         ylab = expression({delta}^15*N~ ('\u2030')))



