library(aqfig)


### Name: ragged.image
### Title: Produces a "ragged" image plot
### Aliases: ragged.image
### Keywords: hplot

### ** Examples

## Build x, y, and z.
x <- c(1, 2, 3, 1, 2, 3)
y <- c(1, 1, 1, 2, 2, 2)
z <- 1:6
z.mat <- matrix(c(1:6), ncol=2)
col.rng <- terrain.colors(6)
par(mfrow=c(1,2))
## Show complete matrix.
image(x=unique(x), y=unique(y), z.mat, zlim=range(z), col=col.rng,
      xlab="x", ylab="y")
## Plot only part of this as a ragged image.  Set z range so that this
## image will use colors consistent with the previous one.
ragged.image(x=x[1:4], y=y[1:4], z=z[1:4], zlim=range(z), col=col.rng,
             xlab="x", ylab="y")



## When some z value(s) is/are much lower/higher than the others,
## the outlying value(s) may appear in color at the extent
## of the range, with the remainder of the data clustered in one (or
## just a few) color bin(s).
x <- c(1, 2, 3, 1, 3, 2, 3, 1, 3)
y <- c(4, 4, 4, 3, 3, 2, 2, 1, 1)
z <- c(0, 47:53, 100)
dev.new()
par(mfrow=c(1,3))
col.rng <- rev(rainbow(n=7, start=0, end=4/6))
ragged.image(x, y, z, col=col.rng)
text(x, y, z, cex=0.8)
## In vain, you might try to "fix" this by setting zlim so that the
## color range reflects the main portion of the z values.  You may
## assume that the outlying value(s) will show up in the extreme edges
## of the color range, but what will actually happen is that the
## outlying values won't be plotted.
ragged.image(x, y, z, col=col.rng, zlim=c(47, 53))
text(x, y, z, cex=0.8)
## Instead, specify zlim to reflect the main porition of the z values,
## and set plt.beyond.zlim=TRUE.  Now, z values below zlim[1] will be
## plotted in the same color as zlim[1]; those above zlim[2] will be
## plotted like z values of zlim[2].  But, remember, now there are
## outlying values whose maginitudes cannot be easily ascertained!
ragged.image(x, y, z, zlim=c(47, 53), col=col.rng, plt.beyond.zlim=TRUE)
text(x, y, z, cex=0.8)



