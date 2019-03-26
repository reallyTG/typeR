library(tsfa)


### Name: FAmodel
### Title: Construct a Factor Model
### Aliases: FAmodel FAmodel.default FAmodel.FAmodel
### Keywords: ts

### ** Examples

  B <- t(matrix(c(0.9, 0.1,
		  0.8, 0.2,
		  0.7, 0.3,
                  0.5, 0.5, 
		  0.3, 0.7,
 		  0.1, 0.9), 2,6))

  z <- FAmodel(B)
  z
  loadings(z)



