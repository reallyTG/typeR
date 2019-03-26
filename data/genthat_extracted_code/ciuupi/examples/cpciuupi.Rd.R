library(ciuupi)


### Name: cpciuupi
### Title: Compute the coverage probability of the CIUUPI
### Aliases: cpciuupi

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

# Graph the coverage probability function
gam <- seq(0, 10, by = 0.1)
cp <- cpciuupi(gam, bsvec, alpha, rho = 0.4)
plot(gam, cp, type = "l", lwd = 2, ylab = "", las = 1, xaxs = "i",
main = "Coverage Probability", col = "blue",
xlab = expression(paste("|", gamma, "|")), ylim = c(0.94999, 0.95001))
abline(h = 1-alpha, lty = 2)




