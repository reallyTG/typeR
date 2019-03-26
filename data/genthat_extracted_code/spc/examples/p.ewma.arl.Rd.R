library(spc)


### Name: p.ewma.arl
### Title: Compute ARLs of binomial EWMA p control charts
### Aliases: p.ewma.arl
### Keywords: ts

### ** Examples

## Gan (1990)

# Table 1

n <- 150
p0 <- .1
z0 <- n*p0

lambda <- c(1, .51, .165)
hu <- c(27, 22, 18)

p.value <- .1 + (0:20)/200

p.EWMA.arl <- Vectorize(p.ewma.arl, "p")

arl1.value <- round(p.EWMA.arl(lambda[1], hu[1], n, p.value, z0, r.mode="round"), digits=2)
arl2.value <- round(p.EWMA.arl(lambda[2], hu[2], n, p.value, z0, r.mode="round"), digits=2)
arl3.value <- round(p.EWMA.arl(lambda[3], hu[3], n, p.value, z0, r.mode="round"), digits=2)

arls <- matrix(c(arl1.value, arl2.value, arl3.value), ncol=length(lambda))
rownames(arls) <- p.value
colnames(arls) <- paste("lambda =", lambda)
arls

## Knoth/Steinmetz (2013)

n <- 5
p0 <- 0.02
z0 <- n*p0
lambda <- 0.3
ucl <- 0.649169922 ## in-control ARL 370.4 (determined with d.res = 2^14 = 16384)

res.list <- 2^(1:12)
arl.list <- NULL
for ( res in res.list ) {
  arl <- p.ewma.arl(lambda, ucl, n, p0, z0, d.res=res)
  arl.list <- c(arl.list, arl)
}
cbind(res.list, arl.list)



