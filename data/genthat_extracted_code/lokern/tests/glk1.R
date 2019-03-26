require(lokern)
data(xSim)
n <- length(xSim)
stopifnot(n == 75)
tt <- ((1:n) - 1/2)/n # equidistant x

(gk <- glkerns(tt, xSim))
summary(gk$est)
gk$bandwidth
glkerns(tt,xSim, deriv = 1)$bandwidth
glkerns(tt,xSim, deriv = 2)$bandwidth

if(!grDevices::dev.interactive(orNone=TRUE)) pdf("glk-derivs-etc.pdf")

demo("glk-derivs", ask = FALSE)
##   ------------
stopifnot(lengths(r.est <- lapply(r, `[[`, "est")) == 300)
rq <- sapply(r.est, quantile)
stopifnot(
    all.equal(
        rq,
        array(c(-3.05424, -1.741756, 0.6749366, 1.758692, 4.387521,
                -39.49606, -7.86697, -5.754756, -2.398544, 34.82773,
                -770.4308, -57.48376, 2.249302, 197.8807, 449.9687,
                -9002.222, -1537.481, 267.3216, 1870.717, 8486.839,
                -198315.3, -24259.81, 18925.91, 87331.48, 216498.5),
              dim = c(5,5), dimnames = list(names(quantile(1)), names(r.est))),
        tol = 7e-7) # 64b : 9.9e-8
)

p.3glks(tt, xSim, kord = 3)

p.3glks(tt, xSim, kord = 4, useB = 0.15)

## Some summary output, but not to too high precision ( platform diffs ) :

g3k5 <- p.3glks(tt, xSim, kord = 5, useB = 0.12) # k.ord = (4,5,4) => less sensical?
stopifnot(lengths(gk5.est <- lapply(g3k5, `[[`, "est")) == 300)
gk5.q <- sapply(gk5.est, quantile, prob = (1:9)/10)
print(gk5.q, digits = 5)

g3k6 <- p.3glks(tt, xSim, kord = 6, useB = 0.2, derivs = 0:3) # k.ord = (6,5,6, 5)
stopifnot(lengths(gk6.est <- lapply(g3k6, `[[`, "est")) == 300)
gk6.q <- sapply(gk6.est, quantile, prob = (1:9)/10)
print(gk6.q, digits = 4)


## "FIXME" visually compare with numerical derivatives (e.g. from splines).
