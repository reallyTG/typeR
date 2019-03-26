library(ciuupi)


### Name: ciuupi
### Title: Compute the confidence interval that utilizes the uncertain
###   prior information
### Aliases: ciuupi

### ** Examples

# Specify alpha, a, c, x
alpha <- 0.05
a <- c(0, 2, 0, -2)
c <- c(0, 0, 0, 1)
x1 <- c(-1, 1, -1, 1)
x2 <- c(-1, -1, 1, 1)
x <- cbind(rep(1, 4), x1, x2, x1*x2)

# Find the vector (b(1),b(2),...,b(5),s(0),s(1),...,s(5)) that specifies the
# CIUUPI: (this may take a few minutes to run)
## No test: 
bsvec <- bsciuupi(alpha, a = a, c = c, x = x)
## End(No test)

# The result (to 7 decimal places) is
bsvec <- c(-0.03639701, -0.18051953, -0.25111411, -0.15830362, -0.04479113,
           1.71997203, 1.79147968, 2.03881195, 2.19926399, 2.11845381,
           2.00482563)

# Specify t and y
t <- 0
y <- c(87.2, 88.4, 86.7, 89.2)

# Find the CIUUPI
res <- ciuupi(alpha, a, c, x, bsvec, t, y, natural = 1, sig = 0.8)
res




