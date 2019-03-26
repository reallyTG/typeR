library(CNOGpro)


### Name: CNOGpro
### Title: Set up a new CNOGpro experiment
### Aliases: CNOGpro

### ** Examples

carsonella <- CNOGpro(hitsfile=system.file("extdata/carsonellahits.tab", package="CNOGpro"),
gbkfile=system.file("extdata/CP003467.gbk",package="CNOGpro"), windowlength=100,
name="Artificial Carsonella ruddii data")
plotCNOGpro(carsonella)
printCNOGpro(carsonella)




