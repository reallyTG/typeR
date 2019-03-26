library(rgl)


### Name: points3d
### Title: add primitive set shape
### Aliases: points3d lines3d segments3d triangles3d quads3d
### Keywords: dynamic

### ** Examples

# Show 12 random vertices in various ways. 

M <- matrix(rnorm(36), 3, 12, dimnames = list(c('x', 'y', 'z'), 
                                       rep(LETTERS[1:4], 3)))

# Force 4-tuples to be convex in planes so that quads3d works.

for (i in c(1, 5, 9)) {
    quad <- as.data.frame(M[, i + 0:3])
    coeffs <- runif(2, 0, 3)
    if (mean(coeffs) < 1) coeffs <- coeffs + 1 - mean(coeffs)
    quad$C <- with(quad, coeffs[1]*(B - A) + coeffs[2]*(D - A) + A)
    M[, i + 0:3] <- as.matrix(quad)
}

open3d()

# Rows of M are x, y, z coords; transpose to plot

M <- t(M)
shift <- matrix(c(-3, 3, 0), 12, 3, byrow = TRUE)

points3d(M)
lines3d(M + shift)
segments3d(M + 2*shift)
triangles3d(M + 3*shift, col = 'red')
quads3d(M + 4*shift, col = 'green')  
text3d(M + 5*shift, texts = 1:12)

# Add labels

shift <- outer(0:5, shift[1, ])
shift[, 1] <- shift[, 1] + 3
text3d(shift, 
       texts = c('points3d', 'lines3d', 'segments3d',
         'triangles3d', 'quads3d', 'text3d'),
       adj = 0)
 rgl.bringtotop()



