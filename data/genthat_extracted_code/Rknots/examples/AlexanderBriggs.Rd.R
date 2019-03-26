library(Rknots)


### Name: AlexanderBriggs
### Title: Alexander-Briggs reduction of a polygonal knot or link
### Aliases: AlexanderBriggs
### Keywords: structurereduction

### ** Examples

#reducing a knot
k <- makeExampleKnot(k = TRUE)
AlexanderBriggs(points3D = k)

#reducing a link
k <- makeExampleKnot(k = FALSE)
AlexanderBriggs(points3D = k$points3D, ends = k$ends)



