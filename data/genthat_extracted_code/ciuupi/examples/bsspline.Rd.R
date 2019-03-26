library(ciuupi)


### Name: bsspline
### Title: Evaluate the functions b and s at x
### Aliases: bsspline

### ** Examples

alpha <- 0.05

# Find the vector (b(1),b(2),...,b(5),s(0),s(1),...,s(5)) that specifies the
# CIUUPI: (this may take a few minutes to run)
## No test: 
bsvec <- bsciuupi(alpha, rho = 0.4)
## End(No test)

# The result (to 7 decimal places) is
bsvec <- c(0.129443483, 0.218926703, 0.125880945, 0.024672734, -0.001427343,
           1.792489585, 1.893870240, 2.081786492, 2.080407355,  1.986667246,
           1.958594824)

# Graph the functions b and s
x <- seq(0, 8, by = 0.1)
xseq <- seq(0, 6, by = 1)
bvec <- c(0, bsvec[1:5], 0)
quantile <- qnorm(1-(alpha)/2, 0, 1)
svec <- c(bsvec[6:11], quantile)
splineval <- bsspline(x, bsvec, alpha)

plot(x, splineval[, 2], type = "l", main = "b function",
ylab = " ", las = 1, lwd = 2, xaxs = "i", col = "blue")
points(xseq, bvec, pch = 19, col = "blue")
plot(x, splineval[, 3], type = "l", main = "s function",
ylab = " ", las = 1, lwd = 2, xaxs = "i",  col = "blue")
points(xseq, svec, pch = 19, col = "blue")




