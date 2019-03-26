library(shotGroups)


### Name: getConfEll
### Title: Confidence ellipse
### Aliases: getConfEll getConfEll.data.frame getConfEll.default

### ** Examples

# coordinates given by a suitable data frame
(ce <- getConfEll(DFsavage, level=0.5, dstTarget=100,
                  conversion='yd2in'))

# plot points, center, parametric confidence
# ellipse, and its axes
plot(point.y ~ point.x, data=DFsavage, asp=1, pch=16)
drawEllipse(ce, axes=TRUE, fg='blue', colCtr='blue', lwd=2, pch=4, cex=2)

# coordinates given by a matrix
## Not run: 
##D xy <- matrix(round(rnorm(100, 0, 5), 2), ncol=2)
##D getConfEll(xy, level=0.5, dstTarget=25, conversion='m2cm')
## End(Not run)



