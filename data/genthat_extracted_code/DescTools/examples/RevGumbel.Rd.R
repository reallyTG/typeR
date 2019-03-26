library(DescTools)


### Name: pRevGumbel
### Title: "Reverse" Gumbel Distribution Functions
### Aliases: dRevGumbel pRevGumbel qRevGumbel qRevGumbelExp rRevGumbel
### Keywords: distribution

### ** Examples

curve(pRevGumbel(x, scale= 1/2), -3,2, n=1001, col=1, lwd=2,
      main = "RevGumbel(x, scale = 1/2)")
abline(h=0:1, v = 0, lty=3, col = "gray30")
curve(dRevGumbel(x, scale= 1/2),       n=1001, add=TRUE,
      col = (col.d <- adjustcolor(2, 0.5)), lwd=3)
legend("left", c("cdf","pdf"), col=c("black", col.d), lwd=2:3, bty="n")

med <- qRevGumbel(0.5, scale=1/2)
cat("The median is:",  format(med),"\n")



