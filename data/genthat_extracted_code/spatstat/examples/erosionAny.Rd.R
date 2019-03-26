library(spatstat)


### Name: erosionAny
### Title: Morphological Erosion of Windows
### Aliases: erosionAny %(-)%
### Keywords: spatial math

### ** Examples

  B <- square(c(-0.1, 0.1))
  RminusB <- letterR %(-)% B
  FR <- grow.rectangle(Frame(letterR), 0.3)
  plot(FR, main="", type="n")
  plot(letterR, add=TRUE, lwd=2, hatch=TRUE, box=FALSE)
  plot(RminusB, add=TRUE, col="blue", box=FALSE)
  plot(shift(B, vec=c(3.49, 2.98)),
       add=TRUE, border="red", lwd=2)



