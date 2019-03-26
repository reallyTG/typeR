library(fCopulae)


### Name: CopulaClass
### Title: Bivariate Copula Class
### Aliases: CopulaClass fCOPULA fCOPULA-class show,fCOPULA-method
###   pfrechetCopula
### Keywords: models

### ** Examples

## fCOPULA -
   getClass("fCOPULA")
   
## pfrechet -
   # The Frechet Copula - m:
   pfrechetCopula(0.5)
   pfrechetCopula(0.25, 0.75)
   pfrechetCopula(runif(5))
   
## grid2d - 
   grid2d()
   pfrechetCopula(grid2d())



