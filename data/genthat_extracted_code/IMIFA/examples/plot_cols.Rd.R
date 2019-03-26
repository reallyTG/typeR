library(IMIFA)


### Name: plot_cols
### Title: Plots a matrix of colours
### Aliases: plot_cols
### Keywords: plotting

### ** Examples

# Generate a colour matrix using mat2cols()
mat      <- matrix(rnorm(100), nrow=10, ncol=10)
mat[2,3] <- NA
cols     <- heat.colors(12)[12:1]
(matcol  <- mat2cols(mat, cols=cols))

# Use plot_cols() to visualise the colours matrix
par(mar=c(5.1, 4.1, 4.1, 3.1))
plot_cols(matcol)

# Add a legend using heat_legend()
heat_legend(mat, cols=cols); box(lwd=2)

# Replace colour of exact zero entries:
# Important to call mat2cols() first, (to include 0 in the cuts),
# then replace relevant entries with NA for plot_cols(), i.e.
mat[2,3] <- 0
matcol2  <- mat2cols(mat, cols=cols)
plot_cols(replace(matcol2, mat == 0, NA), na.col="blue")
heat_legend(mat, cols=cols); box(lwd=2)



