library(DGVM3D)


### Name: row.disc
### Title: row-wise distribution of points in a disc
### Aliases: row.disc

### ** Examples

par(mfrow=c(2,2), mai=c(0, 0, 0.5, 0))
for (n in sample(500, 4)) {
  ret=row.disc(n)
  plot(cos(seq(0, 2 * pi, length.out=7)) * 1.154701,
       sin(seq(0, 2 * pi, length.out=7)) * 1.154701,
       type="l", axes = FALSE, ylab = "", xlab="", main=n)
  points(ret)
}



