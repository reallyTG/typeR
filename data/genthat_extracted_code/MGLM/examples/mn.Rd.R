library(MGLM)


### Name: rmn
### Title: The Multinomial Distribution
### Aliases: rmn mn dmn
### Keywords: distribution models

### ** Examples

m <- 20
prob <- c(0.1, 0.2)
dm.Y <- rdirmn(n=10, m, prob)	
pdfln <- dmn(dm.Y, prob)



