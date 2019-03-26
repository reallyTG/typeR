library(klaR)


### Name: tritrafo
### Title: Barycentric plots
### Aliases: tritrafo
### Keywords: dplot

### ** Examples

tritrafo(0.1, 0.2, 0.7)
tritrafo(0.1, 0.2, 0.6) # warning 

triplot()
points(tritrafo(0.1, 0.2, 0.7), col="red")
tripoints(0.1, 0.2, 0.7, col="green")  # the same

tritrafo(c(0.1,0.2), c(0.3,0.4), c(0.6,0.4))
tritrafo(diag(3))

point <- c(0.25,0.6,0.15)
triplot(point, pch=16)
text(tritrafo(point), "(0.25, 0.60, 0.15)", adj=c(0.5,2)) # add a label 



