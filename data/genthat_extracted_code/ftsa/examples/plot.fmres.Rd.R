library(ftsa)


### Name: plot.fmres
### Title: Plot residuals from a fitted functional model.
### Aliases: plot.fmres
### Keywords: hplot

### ** Examples

# colorspace package was used to provide a more coherent color option.	
plot(residuals(ftsm(y = ElNino)), type = "filled.contour", xlab = "Month", 
     ylab = "Residual sea surface temperature")



