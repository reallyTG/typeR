library(colourvision)


### Name: colour_space
### Title: N-dimensional colour spaces
### Aliases: colour_space

### ** Examples

#A trichromatic colour space based on Endler and Mielke (2005) 
tri<-colour_space(n=3, length=0.75, q=c(0.5,0.2,0.3))

#showing:
#(1) Limits of the colour space (triangle)
plot(0, ylim=c(-1,1), xlim=c(-1,1), asp=1, ylab="X2", xlab="X1", type="n")
polygon(x=tri$vector_matrix[1,], y=tri$vector_matrix[2,], lty=2)

#(2) Vectors (length=0.75) used to build the colour space (arrows)
arrows(x0=0,y0=0, x1=tri$vector_matrix[1,1], y1=tri$vector_matrix[2,1], col="red")
arrows(x0=0,y0=0, x1=tri$vector_matrix[1,2], y1=tri$vector_matrix[2,2], col="red")
arrows(x0=0,y0=0, x1=tri$vector_matrix[1,3], y1=tri$vector_matrix[2,3], col="red")

#(3) Colour loci of given photoreceptor outputs
points(x=tri$coordinates[[1]], y=tri$coordinates[[2]], pch=21, col="blue", bg="blue")



