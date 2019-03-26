library(copula)


### Name: acR
### Title: Distribution of the Radial Part of an Archimedean Copula
### Aliases: pacR qacR
### Keywords: distribution

### ** Examples

## setup
family <- "Gumbel"
tau <- 0.5
m <- 256
dmax <- 20
x <- seq(0, 20, length.out=m)

## compute and plot pacR() for various d's
y <- vapply(1:dmax, function(d)
            pacR(x, family=family, theta=iTau(archmCopula(family), tau), d=d),
            rep(NA_real_, m))
plot(x, y[,1], type="l", ylim=c(0,1),
     xlab = quote(italic(x)), ylab = quote(F[R](x)),
     main = substitute(italic(F[R](x))~~ "for" ~ d==1:.D, list(.D = dmax)))
for(k in 2:dmax) lines(x, y[,k])



