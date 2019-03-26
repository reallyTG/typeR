library(RcmdrPlugin.TeachStat)


### Name: calcularResumenVariablesDiscretas
### Title: Summary statistics for discrete variables
### Aliases: calcularResumenVariablesDiscretas

### ** Examples

## Not run: 
##D data(cars93)
##D calcularResumenVariablesDiscretas(data=cars93["Cylinders"],group=NULL)
##D calcularResumenVariablesDiscretas(data=cars93["Cylinders"],group=cars93$Airbags)
##D bb <- calcularResumenVariablesDiscretas(data=cars93["Cylinders"],group=cars93$Airbags,
##D                                         tablaFrecuencia=TRUE)
##D str(bb)
##D bb
##D bb$.summary
##D class(bb$.summary)
##D 
##D calcularResumenVariablesDiscretas(data=cars93["Horsepower"], tablaFrecuencia=TRUE)
##D calcularResumenVariablesDiscretas(data=cars93["Horsepower"], tablaFrecuencia=TRUE, cortes=5)
##D calcularResumenVariablesDiscretas(data=cars93["Horsepower"], tablaFrecuencia=TRUE,
##D                                   cortes=c(50,100,200,250,300))
##D calcularResumenVariablesDiscretas(data=cars93["Horsepower"], groups=cars93$Airbags, 
##D                                   tablaFrecuencia=TRUE, cortes=5)
## End(Not run)



