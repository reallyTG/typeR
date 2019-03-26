library(SVMMaj)


### Name: isb
### Title: I-spline basis of each column of a given matrix
### Aliases: isb

### ** Examples

## plot the spline transformation given a monotone sequence
B0 <- isb(0:100, spline.knots = 2, spline.degree = 3)
plot(NULL, xlim = c(0, 140), ylim = c(0, 1), xlab = 'x',ylab = 'I-spline')
for(i in 1:ncol(B0))
  lines(B0[,i], col = i, lwd = 3)
legend('bottomright', legend = 1:ncol(B0), col = 1:ncol(B0),
  lty = 1, lwd = 3, title = 'Spline Columns'
)
## create I-spline basis for the first 50 observations
x  <- iris$Sepal.Length
B1  <- isb(x[1:50], spline.knots = 4, spline.degree = 3)
## extracting the spline transformation settings
spline.param <- attr(B1, 'splineInterval')
## use the same settings to apply to the next 50 observations
B2 <- isb(x[-(1:50)], spline.degree = 3, knots = spline.param)



