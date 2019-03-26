library(HoRM)


### Name: SSCP.fn
### Title: Sums of Squares and Cross-Products Matrices for a MANOVA Table
### Aliases: SSCP.fn
### Keywords: file

### ** Examples
 
## Applied to the amit dataset.

data(amit)

fits <- manova(cbind(TOT, AMI) ~ ., data = amit)
SSCP.fn(fits = fits)




