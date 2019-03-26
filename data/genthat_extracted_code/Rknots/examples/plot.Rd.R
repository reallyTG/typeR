library(Rknots)


### Name: plot-methods
### Title: Plot the diagram of a Knot object.
### Aliases: plot,Knot-method
### Keywords: methods

### ** Examples

knot <- makeExampleKnot(k = TRUE)
knot <- newKnot(knot)
link <- makeExampleKnot(k = FALSE)
link <- newKnot(link$points3D, link$ends)

plot(knot)
plot(knot, lwd = 2.5) #to emphasize the overcrossings
plot(link)
plot(link, lwd = 2.5) #to emphasize the overcrossings



