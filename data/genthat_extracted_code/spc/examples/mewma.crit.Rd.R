library(spc)


### Name: mewma.crit
### Title: Compute alarm threshold of MEWMA control charts
### Aliases: mewma.crit
### Keywords: ts

### ** Examples

# Rigdon (1995), p. 358, Tab. 1
p <- 4
L0 <- 500
r <- .25
h4 <- mewma.crit(r, L0, p)
h4
## original value is 16.38.

# Knoth (2017), p. 82, Tab. 2
p <- 3
L0 <- 1e3
lambda <- c(0.25, 0.2, 0.15, 0.1, 0.05)
h4 <- rep(NA, length(lambda) )
for ( i in 1:length(lambda) ) h4[i] <- mewma.crit(lambda[i], L0, p, r=20)
round(h4, digits=2)
## original values are
## 15.82 15.62 15.31 14.76 13.60



