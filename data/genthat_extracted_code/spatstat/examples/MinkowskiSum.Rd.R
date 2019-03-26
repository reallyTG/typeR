library(spatstat)


### Name: MinkowskiSum
### Title: Minkowski Sum of Windows
### Aliases: MinkowskiSum %(+)% dilationAny
### Keywords: spatial math

### ** Examples

  B <- square(0.2)
  RplusB <- letterR %(+)% B

  opa <- par(mfrow=c(1,2))
  FR <- grow.rectangle(Frame(letterR), 0.3)
  plot(FR, main="")
  plot(letterR, add=TRUE, lwd=2, hatch=TRUE, hatchargs=list(texture=5))
  plot(shift(B, vec=c(3.675, 3)),
       add=TRUE, border="red", lwd=2)
  plot(FR, main="")
  plot(letterR, add=TRUE, lwd=2, hatch=TRUE, hatchargs=list(texture=5))
  plot(RplusB, add=TRUE, border="blue", lwd=2,
         hatch=TRUE, hatchargs=list(col="blue"))
  par(opa)

  plot(cells %(+)% square(0.1))



