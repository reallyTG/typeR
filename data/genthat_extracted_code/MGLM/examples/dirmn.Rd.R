library(MGLM)


### Name: rdirmn
### Title: The Dirichlet Multinomial Distribution
### Aliases: rdirmn dirmn ddirmn
### Keywords: distribution models

### ** Examples

m <- 20
alpha <- c(0.1, 0.2)
dm.Y <- rdirmn(n=10, m, alpha)	
pdfln <- ddirmn(dm.Y, alpha)



