library(dng)


### Name: splitt
### Title: Split-t distribution
### Aliases: splitt dsplitt psplitt qsplitt rsplitt
### Keywords: asymmetric distribution student-t

### ** Examples


n <- 3
mu <- c(0,1,2)
df <- rep(10,3)
phi <- c(0.5,1,2)
lmd <- c(1,2,3)

q0 <- rsplitt(n, mu, df, phi, lmd)
d0 <- dsplitt(q0, mu, df, phi, lmd, logarithm = FALSE)
p0 <- psplitt(q0, mu, df, phi, lmd)
q1 <- qsplitt(p0,mu, df, phi, lmd)
all.equal(q0, q1)




