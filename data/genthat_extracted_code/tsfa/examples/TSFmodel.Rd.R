library(tsfa)


### Name: TSFmodel
### Title: Construct a Time Series Factor Model
### Aliases: TSFmodel TSFmodel.default TSFmodel.TSFmodel TSFmodel.FAmodel
### Keywords: ts

### ** Examples

  f <- matrix(c(2+sin(pi/100:1),5+3*sin(2*pi/5*(100:1))),100,2)
  B <- t(matrix(c(0.9, 0.1,
		  0.8, 0.2,
		  0.7, 0.3,
                  0.5, 0.5, 
		  0.3, 0.7,
 		  0.1, 0.9), 2,6))

  z <- TSFmodel(B, f=f)
  tfplot(z)



