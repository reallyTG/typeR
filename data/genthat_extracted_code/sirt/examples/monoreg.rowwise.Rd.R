library(sirt)


### Name: monoreg.rowwise
### Title: Monotone Regression for Rows or Columns in a Matrix
### Aliases: monoreg.rowwise monoreg.colwise
### Keywords: Monotone regression Isotone regression

### ** Examples

y <- c(22.5, 23.33, 20.83, 24.25 )
w <- c( 3,3,3,2)
# define matrix input
yM <- matrix( 0, nrow=2, ncol=4 )
wM <- yM
yM[1,] <- yM[2,] <- y
wM[1,] <- w
wM[2,] <- c(1,3,4, 3 )

# fit rowwise monotone regression
monoreg.rowwise( yM, wM )
# compare results with monoreg function from fdrtool package
## Not run: 
##D miceadds::library_install("fdrtool")
##D fdrtool::monoreg(x=yM[1,], w=wM[1,])$yf
##D fdrtool::monoreg(x=yM[2,], w=wM[2,])$yf
## End(Not run)



