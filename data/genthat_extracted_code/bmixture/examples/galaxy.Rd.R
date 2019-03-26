library(bmixture)


### Name: galaxy
### Title: Galaxy data
### Aliases: galaxy
### Keywords: datasets

### ** Examples

data( galaxy )
  
hist( galaxy, prob = TRUE, xlim = c( 0, 40 ), ylim = c( 0, 0.3 ), nclass = 20, 
      col = "gray", border = "white" )

lines( density( galaxy ), col = "black", lwd = 2 ) 



