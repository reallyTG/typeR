library(pracma)


### Name: trigPoly
### Title: Trigonometric Polynomial
### Aliases: trigPoly
### Keywords: math

### ** Examples

# Data available only from 0 to pi/2
t <- seq(0, pi, len=7)
x <- 0.5 + 0.25*sin(t) + 1/3*cos(t) - 1/3*sin(2*t) - 0.25*cos(2*t)

# use standard regression techniques
A <- cbind(1, cos(t), sin(t), cos(2*t), sin(2*t))
ab <- qr.solve(A, x)
ab
# [1]  0.5000000  0.3333333  0.2500000 -0.2500000 -0.3333333
ts <- seq(0, 2*pi, length.out = 100)
xs <- ab[1] + ab[2]*cos(ts) +
      ab[3]*sin(ts) + ab[4]*cos(2*ts) +ab[5]*sin(2*ts)

## Not run: 
##D # plot to make sure
##D plot(t, x, col = "red", xlim=c(0, 2*pi), ylim=c(-2,2),
##D            main = "Trigonometric Regression")
##D lines(ts, xs, col="blue")
##D grid()
## End(Not run)



