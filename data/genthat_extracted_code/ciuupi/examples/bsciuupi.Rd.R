library(ciuupi)


### Name: bsciuupi
### Title: Compute the vector (b(1),...,b(5),s(0),...,s(5)) that specifies
###   the CIUUPI
### Aliases: bsciuupi

### ** Examples

# Compute the vector (b(1),...,b(5),s(0),...,s(5)) that specifies the CIUUPI,
# for given alpha and rho: (may take a few minutes to run)
## No test: 
bsvec <- bsciuupi(0.05, rho = 0.4)
## End(No test)

# The result (to 7 decimal places) is
bsvec <- c(0.129443483, 0.218926703, 0.125880945, 0.024672734, -0.001427343,
           1.792489585, 1.893870240, 2.081786492, 2.080407355,  1.986667246,
           1.958594824)
bsvec

# Compute the vector (b(1),...,b(5),s(0),...,s(5)) that specifies the CIUUPI,
# for given alpha, a, c and x
x1 <- c(-1, 1, -1, 1)
x2 <- c(-1, -1, 1, 1)
x <- cbind(rep(1, 4), x1, x2, x1*x2)
a <- c(0, 2, 0, -2)
c <- c(0, 0, 0, 1)

# The following may take a few minutes to run:
## No test: 
bsvec2 <- bsciuupi(0.05, a = a, c = c, x = x)
## End(No test)

# The result (to 7 decimal places) is
bsvec2 <- c(-0.03639701, -0.18051953, -0.25111411, -0.15830362, -0.04479113,
           1.71997203, 1.79147968, 2.03881195, 2.19926399, 2.11845381,
           2.00482563)
bsvec2




