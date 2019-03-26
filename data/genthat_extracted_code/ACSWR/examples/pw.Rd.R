library(ACSWR)


### Name: pw
### Title: The Linguistic Probe Word Analysis
### Aliases: pw
### Keywords: Testing for sphericity

### ** Examples

data(pw)
sigma <- var(pw[2:6])
p <- ncol(pw)-1; v <- nrow(pw)-1
u <- p^p*(det(sigma))/(sum(diag(sigma))^p)
u1 <- -(v-(2*p^2+p+2)/(6*p))*log(u)
u;u1



