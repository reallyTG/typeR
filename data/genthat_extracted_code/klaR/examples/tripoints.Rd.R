library(klaR)


### Name: tripoints
### Title: Barycentric plots
### Aliases: tripoints trilines
### Keywords: aplot

### ** Examples

triplot()  # empty plot 
tripoints(0.1, 0.2, 0.7)                        # a point 
tripoints(c(0.2, 0.6), c(0.3, 0.3), c(0.5, 0.1),
    pch = c(2, 6))                              # two points
trilines(c(0.1, 0.6), c(0.2, 0.3), c(0.7, 0.1), 
    col = "blue", lty = "dotted")               # a line 

trilines(centerlines(3))



