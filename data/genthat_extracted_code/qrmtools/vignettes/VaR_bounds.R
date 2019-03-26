## ---- message = FALSE----------------------------------------------------
library(qrmtools)
library(copula)
library(combinat) # for permn()
library(sfsmisc) # for eaxis()
doPDF <- FALSE

## ------------------------------------------------------------------------
qF2 <- function(p, th = 2) qPar(p, shape = th) # Par(2) quantile function
pF2 <- function(q, th = 2) pPar(q, shape = th) # Par(2) distribution function
dim <- 8 # variable dimension (we use 8 or 100 here)

## ---- fig.align = "center", fig.width = 6, fig.height = 6, fig.show = "hold"----
d <- 8 # dimension
s <- c(1, 5, 10, 100, 500, 1000)
t <- sapply(seq_along(s), function(i) {
    res <- exp(seq(log(1e-3), log(s[i]/d), length.out = 257))
    res[length(res)] <- s[i]/d # to avoid numerical issues (t > s/d)
    res
})
f <- sapply(seq_along(s), function(i)
            sapply(t[,i], function(t.)
                   qrmtools:::dual_bound_2(s[i], t = t., d = d, pF = pF2) -
                   qrmtools:::dual_bound_2_deriv_term(s[i], t = t., d = d, pF = pF2)))
palette <- colorRampPalette(c("maroon3", "darkorange2", "royalblue3"), space = "Lab")
cols <- palette(6)
if(doPDF)
    pdf(file = (file <- paste0("fig_worst_VaR_hom_dual_h_Par=2_d=",d,".pdf")),
        width = 6, height = 6)
plot(t[,1], f[,1], type = "l", log = "x", xlim = range(t), ylim = range(f), col = cols[1],
     xlab = "t", ylab = expression("h(s,t) for d = 8 and F being Par(2)"))
lines(t[,2], f[,2], col = cols[2])
lines(t[,3], f[,3], col = cols[3])
lines(t[,4], f[,4], col = cols[4])
lines(t[,5], f[,5], col = cols[5])
lines(t[,6], f[,6], col = cols[6])
abline(h = 0, lty = 2)
legend("topright", lty = rep(1,6), col = cols,
       bty = "n", legend = as.expression(lapply(1:6,
           function(i) substitute(s==s., list(s. = s[i])))))
if(doPDF) dev.off()

## ---- fig.align = "center", fig.width = 6, fig.height = 6, fig.show = "hold"----
theta <- c(0.5, 1, 2, 4) # theta values
s <- seq(48, 2000, length.out = 257) # s values
D <- sapply(theta, function(th)
            sapply(s, function(s.)
                   dual_bound(s., d = d, pF = function(q) pPar(q, shape = th)))) # (s, theta) matrix
if(doPDF)
    pdf(file = (file <- paste0("fig_worst_VaR_hom_dual_D_s_Par=",
                             paste0(theta, collapse="_"),"_d=",d,".pdf")),
        width = 6, height = 6)
plot(s, D[,1], type = "l", ylim = range(D), col = "maroon3",
     ylab = substitute("Dual bound D(s) for d ="~d.~"Par("*theta*") margins", list(d. = d)))
lines(s, D[,2], col = "darkorange2")
lines(s, D[,3], col = "royalblue3")
lines(s, D[,4], col = "black")
legend("topright", lty = rep(1,4),
       col = c("maroon3", "darkorange2", "royalblue3", "black"),
       bty = "n", legend = as.expression(lapply(1:4,
           function(j) substitute(theta==j, list(j = theta[j])))))
if(doPDF) dev.off()

## ---- fig.align = "center", fig.width = 6, fig.height = 6----------------
d <- 8 # dimension
alpha <- 0.99 # confidence level
c <- seq(0, (1-alpha)/d, length.out = 129) # domain of h
h.aux <- qrmtools:::Wang_h_aux(c, level = alpha, d = d, qF = qF2)
par(mar = c(5, 4+1, 4, 2) + 0.1) # increase space (for y axis label)
plot(c, h.aux, type = "l", xlab = "c (in initial interval)",
     ylab = expression(frac(d-1,d)~{F^{-1}}(a[c])+frac(1,d)~{F^{-1}}(b[c])))

## ---- fig.align = "center", fig.width = 6, fig.height = 6, fig.show = "hold"----
h <- sapply(c, function(c.) qrmtools:::Wang_h(c., level = alpha, d = d, qF = qF2))
if(doPDF)
    pdf(file = (file <- paste0("fig_worst_VaR_",alpha,"_hom_Wang_h_Par=2_d=",d,"_num.pdf")),
        width = 6, height = 6)
plot(c, h, type = "l", xlab = "c (in initial interval)",
     ylab = substitute("h(c) for"~~alpha~"= 0.99 and d ="~d.~"Par(2) margins",
                       list(d. = d)))
abline(h = 0, lty = 2)
if(doPDF) dev.off()

## ------------------------------------------------------------------------
sapply(c(0, (1-alpha)/d), function(c.)
       qrmtools:::Wang_h(c., level = alpha, d = d, qF = qF2)) # -Inf, 0

## ------------------------------------------------------------------------
method <- "Wang.Par" # this also holds for (the numerical) method = "Wang"
th <- 0.99
qrmtools:::Wang_h(0, level = alpha, d = d, method = method, shape = th) # NaN => uniroot() fails
## Note: Wang_h() is actually already NaN for c <= 1e-17
qrmtools:::Wang_h_aux(0, level = alpha, d = d, method = method, shape = th) # Inf

## ------------------------------------------------------------------------
d <- dim # dimension
alpha <- 0.99 # confidence level
theta <- c(0.1, 0.5, 1, 5, 10, 50) # theta values
palette <- colorRampPalette(c("darkorange2", "maroon3", "royalblue3", "black"), space = "Lab")
cols <- palette(length(theta))
c <- seq(0, (1-alpha)/d, length.out = 2^13+1)
## => They all go further down to 0 if length.out is increased.
##    Smaller theta thus corresponds to a larger derivative in the root
##    Root-finding thus requires higher precision for smaller theta
h <- matrix(, nrow = length(c), ncol = length(theta))
for(j in 1:length(theta))
    h[,j] <- sapply(c, function(c.)
        qrmtools:::Wang_h(c., level = alpha, d = d, method = "Wang.Par", shape = theta[j]))
z <- h
z[z <= 0] <- NA # > 0 => makes log-scale possible

## ---- fig.align = "center", fig.width = 6, fig.height = 6, fig.show = "hold"----
if(doPDF)
    pdf(file = (file <- paste0("fig_worst_VaR_",alpha,"_hom_Wang_h_Par_d=",d,".pdf")),
        width = 6, height = 6)
plot(NA, xlim = range(c), ylim = range(z, na.rm = TRUE), log = "y", yaxt = "n", xlab = "c",
     ylab = substitute("h(c) for"~~alpha~"= 0.99, d ="~d.~"Par("*theta*") margins",
                       list(d. = d)))
eaxis(2)
for(k in 1:length(theta))
    lines(c, z[,k], col = cols[k])
legend("topleft", bty = "n", lty = rep(1,length(theta)), col = cols,
       legend = as.expression(lapply(1:length(theta),
       function(k) substitute(theta==k, list(k = theta[k])))))
if(doPDF) dev.off()

## ------------------------------------------------------------------------
d <- dim # dimension
alpha <- 1-2^seq(-0.001, -10, length.out = 128) # confidence levels; concentrated near 1
theta <- c(0.1, 0.5, 1, 5, 10, 50) # theta values
VaR <- simplify2array(sapply(alpha, function(a)
    sapply(theta, function(th) VaR_bounds_hom(a, d = d, method = "Wang.Par",
                                              shape = th)), simplify = FALSE))
## => (best/worst VaR, theta, alpha)-matrix

## ---- fig.align = "center", fig.width = 6, fig.height = 6, fig.show = "hold"----
if(doPDF)
    pdf(file = (file <- paste0("fig_worst_VaR_hom_Wang_Par_d=",d,".pdf")),
        width = 7, height = 7)
par(mar = c(5, 4+1, 4, 2) + 0.1) # increase space (for y axis label)
plot(NA, xlim = range(alpha), ylim = range(VaR), log = "xy", yaxt = "n",
     xlab = expression(1-alpha),
     ylab = as.expression(substitute(underline(VaR)[alpha](L^{"+"})~"(dashed) and"~bar(VaR)[alpha](L^{"+"})~
                                     "(solid) for d ="~d.~"and Par("*theta*") margins",
                                     list(d. = d))))
eaxis(2)
for(k in 1:length(theta)) {
    lines(1-alpha, VaR[2,k,], col = cols[k]) # worst VaR
    lines(1-alpha, VaR[1,k,], col = cols[k], lty = 2) # best VaR
}
legend("topright", bty = "n", lty = rep(1,length(theta)), col = cols,
       legend = as.expression(lapply(1:length(theta),
       function(k) substitute(theta==k, list(k = theta[k])))))
if(doPDF) dev.off()

## ------------------------------------------------------------------------
d <- seq(2, 1002, by = 20) # dimensions
alpha <- 0.99 # confidence level
theta <- c(0.1, 0.5, 1, 5, 10, 50) # theta values
VaR <- simplify2array(sapply(d, function(d.)
    sapply(theta, function(th) VaR_bounds_hom(alpha, d = d., method = "Wang.Par",
                                              shape = th)), simplify = FALSE))
## => (best/worst VaR, theta, d)-matrix

## ---- fig.align = "center", fig.width = 6, fig.height = 6, fig.show = "hold"----
if(doPDF)
    pdf(file = (file <- paste0("fig_worst_VaR_hom_Wang_Par_alpha=",alpha,"_in_d.pdf")),
        width = 7, height = 7)
par(mar = c(5, 4+1, 4, 2) + 0.1) # increase space (for y axis label)
plot(NA, xlim = range(d), ylim = range(VaR), log = "xy", yaxt = "n",
     xlab = expression(d),
     ylab = as.expression(substitute(underline(VaR)[a](L^{"+"})~"(dashed) and"~bar(VaR)[a](L^{"+"})~
                                     "(solid) for Par("*theta*") margins",
                                     list(a = alpha))))
eaxis(2)
for(k in 1:length(theta)) {
    lines(d, VaR[2,k,], col = cols[k]) # worst VaR
    lines(d, VaR[1,k,], col = cols[k], lty = 2) # best VaR
}
legend("topleft", bty = "n", lty = rep(1,length(theta)), col = cols,
       legend = as.expression(lapply(1:length(theta),
       function(k) substitute(theta==k, list(k = theta[k])))))
if(doPDF) dev.off()

## ------------------------------------------------------------------------
d <- c(2, 10, 20, 100, 200, 1000) # dimensions
theta <- 10^seq(-1, log(50, base = 10), length.out = 50) # theta values
alpha <- 0.99 # confidence level
VaR <- simplify2array(sapply(d, function(d.)
    sapply(theta, function(th) VaR_bounds_hom(alpha, d = d., method = "Wang.Par",
                                              shape = th)), simplify = FALSE))
## => (best/worst VaR, theta, d)-matrix

## ---- fig.align = "center", fig.width = 6, fig.height = 6, fig.show = "hold"----
if(doPDF)
    pdf(file = (file <- paste0("fig_worst_VaR_hom_Wang_Par_alpha=",alpha,"_in_theta.pdf")),
        width = 6, height = 6)
par(mar = c(5, 4+1, 4, 2) + 0.1) # increase space (for y axis label)
plot(NA, xlim = range(theta), ylim = range(VaR), log = "xy", yaxt = "n",
     xlab = expression(theta),
     ylab = as.expression(substitute(underline(VaR)[a](L^{"+"})~"(dashed) and"~
                          bar(VaR)[a](L^{"+"})~"(solid) for Par("*theta*") margins",
                          list(a = alpha))))
eaxis(2)
bestVaR <- VaR[1,,1]
for(k in 1:length(d)) {
    lines(theta, VaR[2,,k], col = cols[k]) # worst VaR
    if(k >= 2) stopifnot(all.equal(bestVaR, VaR[1,,k]))
}
lines(theta, bestVaR, col = "darkgreen", lty = 2) # best VaR
legend("topright", bty = "n", lty = rep(1,length(d)), col = cols,
       legend = as.expression(lapply(1:length(d),
       function(k) substitute(d==k, list(k = d[k])))))
if(doPDF) dev.off()

## ------------------------------------------------------------------------
## Initial interval for the root finding in case of worst VaR
init_interval <- function(alpha, d, shape, trafo = FALSE, adjusted = FALSE)
{
    if(trafo) {
        low <- if(shape == 1) {
            d/2
        } else {
            (d-1)*(1+shape)/(d-1+shape)
        }
        up <- if(shape > 1) {
            r <- (1+d/(shape-1))^shape
            if(adjusted) 2*r else r
        } else if(shape == 1) {
            e <- exp(1)
            (d+1)^(e/(e-1))
        } else {
            d*shape/(1-shape)+1
        }
        c(low, up)
    } else {
        low <- if(shape > 1) {
            r <- (1-alpha)/((d/(shape-1)+1)^shape + d-1)
            if(adjusted) r/2 else r
        } else if(shape == 1) {
            e <- exp(1)
            (1-alpha)/((d+1)^(e/(e-1))+d-1)
        } else {
            r <- (1-shape)*(1-alpha)/d
            if(adjusted) r/2 else r
        }
        up <- if(shape == 1) (1-alpha)/(3*d/2-1)
              else (1-alpha)*(d-1+shape)/((d-1)*(2*shape+d))
        c(low, up)
    }
}

## Function to compute the best/worst value-at-risk in the homogeneous case with
## Par(theta) margins
VaR_hom_Par <- function(alpha, d, shape, method = c("worst", "best"),
                        trafo = FALSE, interval = NULL, adjusted = FALSE,
                        avoid.cancellation = FALSE, ...)
{
    ## Pareto quantile function
    qF <- function(p) (1 - p)^(-1/shape) - 1

    ## Compute \bar{I}
    Ibar <- function(a, b, alpha, d, shape)
    {
        if(shape == 1) log((1-a)/(1-b))/(b-a) - 1
        else (shape/(1-shape))*((1-b)^(1-1/shape)-(1-a)^(1-1/shape))/(b-a) - 1
    }

    ## Main
    method <- match.arg(method)
    switch(method,
    "worst" = {

        ## Distinguish according to whether we optimize the auxiliary function
        ## on a transformed scale
        h <- if(trafo) {
            ## Auxiliary function to find the root of on (1, Inf)
            if(shape == 1) {
                function(x) x^2 + x*(-d*log(x)+d-2)-(d-1)
            } else {
                function(x)
                (d/(1-shape)-1)*x^(-1/shape + 1) - (d-1)*x^(-1/shape) + x - (d*shape/(1-shape) + 1)
            }
        } else {
            ## Auxiliary function to find the root of on (0, (1-alpha)/d)
            function(c) {
                a <- alpha+(d-1)*c
                b <- 1-c
                Ib <- if(c == (1-alpha)/d) { # Properly deal with limit c = (1-alpha)/d
                    ((1-alpha)/d)^(-1/shape) - 1
                } else {
                    Ibar(a = a, b = b, alpha = alpha, d = d, shape = shape)
                }
                Ib - (qF(a)*(d-1)/d + qF(b)/d)
            }
        }

        ## Do the optimization
        if(is.null(interval)) interval <- init_interval(alpha, d, shape,
                                                        trafo = trafo, adjusted = adjusted)
        c <- uniroot(h, interval = interval, ...)$root
        if(trafo) # convert value back to the right scale (c-scale)
            c <- (1-alpha)/(c+d-1)
        if(avoid.cancellation) {
            t1 <- (1-alpha)/c-(d-1)
            d * ((c^(-1/shape)/d) * ((d-1)*t1^(-1/shape) + 1) - 1) # = qF(a)*(d-1) + qF(b)
        } else {
            a <- alpha+(d-1)*c
            b <- 1-c
            qF(a)*(d-1) + qF(b)
        }
    },
    "best" = {
        max((d-1)*0 + (1-alpha)^(-1/shape)-1, # Note: Typo in Wang, Peng, Yang (2013)
            d*Ibar(a = 0, b = alpha, alpha = alpha, d = d, shape))
    },
    stop("Wrong 'method'"))
}

## ------------------------------------------------------------------------
alpha <- 0.99 # confidence level
d <- dim # dimension
n.th <- 32 # number of thetas
th <- seq(0.2, 5, length.out = n.th) # thetas
qFs <- lapply(th, function(th.) {th.; function(p) qPar(p, shape = th.)}) # n.th-vector of Pareto quantile functions
pFs <- lapply(th, function(th.) {th.; function(q) pPar(q, shape = th.)}) # n.th-vector of Pareto dfs
N <- 1e4 # number of discretization points for RA(); N = 1e5 does not improve the situation

## ---- results = "hide", warning = FALSE----------------------------------
res <- matrix(, nrow = n.th, ncol = 7)
colnames(res) <- c("Wang", "straightforward", "transformed", "Wang.Par",
                   "dual", "RA.low", "RA.up")
pb <- txtProgressBar(max = n.th, style = if(isatty(stdout())) 3 else 1) # setup progress bar
for(i in seq_len(n.th)) {
    ## "Wang" (numerical integration with smaller uniroot() tolerance; still
    ## numerically critical -- we catch "the integral is probably divergent"-errors here)
    Wang.num.res <- tryCatch(VaR_bounds_hom(alpha, d = d, qF = qFs[[i]])[2], error = function(e) e)
    res[i,"Wang"] <- if(is(Wang.num.res, "simpleError")) NA else Wang.num.res
    ## Our straightforward implementation
    res[i,"straightforward"] <- VaR_hom_Par(alpha, d = d, shape = th[i])
    ## Our straightforward implementation based on the transformed auxiliary function
    res[i,"transformed"] <- VaR_hom_Par(alpha, d = d, shape = th[i], trafo = TRUE)
    ## "Wang.Par" (using a smaller uniroot() tolerance and adjusted initial interval)
    res[i,"Wang.Par"] <- VaR_bounds_hom(alpha, d = d, method = "Wang.Par", shape = th[i])[2]
    ## "dual" (with uniroot()'s default tolerance)
    res[i,"dual"] <- VaR_bounds_hom(alpha, d = d, method = "dual",
                                    interval = crude_VaR_bounds(alpha, qF = qFs[[i]], d = d),
                                    pF = pFs[[i]])[2]
    ## Rearrangement Algorithm
    set.seed(271) # use the same random permutation for each theta
    RA. <- RA(alpha, qF = rep(qFs[i], d), N = N)
    res[i,"RA.low"] <- RA.$bounds[1]
    res[i,"RA.up"]  <- RA.$bounds[2]
    ## Progress
    setTxtProgressBar(pb, i) # update progress bar
}
close(pb) # close progress bar

## ---- fig.align = "center", fig.width = 6, fig.height = 6, fig.show = "hold"----
res. <- res/res[,"dual"] # standardize (by dual method)
ylim <- range(res., na.rm = TRUE)
if(doPDF)
    pdf(file = (file <- paste0("fig_worst_VaR_",alpha,"_hom_comparison_d=",
                             d,"_N=",N,".pdf")), width = 7, height = 7)
par(mar = c(5, 4+1, 4, 2) + 0.1) # increase space (for y axis label)
plot(th, res.[,"Wang"], type = "l", ylim = ylim,
     xlab = expression(theta), ylab = substitute("Standardized (by dual method)"~
     bar(VaR)[0.99]~"for d ="~d.~"Par("*theta*") margins", list(d. = d)),
     col = "gray60", lty = 2, lwd = 5.5) # Wang (with numerical integration)
lines(th, res.[,"straightforward"], col = "maroon3", lty = 1, lwd = 1) # still bad (although we have an initial interval)
lines(th, res.[,"transformed"], col = "black", lty = 1, lwd = 1) # okay
lines(th, res.[,"Wang.Par"], col = "royalblue3", lty = 2, lwd = 2.5) # Wang Pareto (wo num. integration)
lines(th, res.[,"RA.low"], col = "black", lty = 3, lwd = 1) # lower RA bound
lines(th, res.[,"RA.up"],  col = "black", lty = 2, lwd = 1) # upper RA bound
legend("topright", bty = "n",
       col = c("gray60", "maroon3", "black", "royalblue3", "black", "black"),
       lty = c(2,1,1,2,3,2), lwd = c(5.5,1,1,2.5,1,1),
       legend = c("Wang (num. int.)", "Wang Pareto (straightforward)",
                  "Wang Pareto (transformed)", "Wang Pareto (wo num. int.)",
                  "Lower RA bound", "Upper RA bound"))
if(doPDF) dev.off()

## ---- fig.align = "center", fig.width = 6, fig.height = 6----------------
tol <- 2.2204e-16
wVaR.tol <- sapply(th, function(th.)
    VaR_hom_Par(alpha = alpha, d = d, shape = th., tol = tol))
plot(th, wVaR.tol/res[,"dual"], type = "l", ylim = ylim,
     xlab = expression(theta), ylab = "Wang's approach (straightforward) but with smaller tol")

## ---- warning = FALSE----------------------------------------------------
alpha <- 0.99 # confidence level
d <- seq(2, 1002, by = 20) # dimensions
theta <- c(0.1, 0.5, 1, 5, 10, 50) # theta values
VaR <- simplify2array(sapply(d, function(d.)
    sapply(theta, function(th) {
        res <- tryCatch(VaR_hom_Par(alpha, d = d., shape = th, tol = tol),
                        error = function(e) e)
        if(is(res, "simpleError")) { warning(conditionMessage(res)); NA }
        else res
    }), simplify = FALSE))

## ------------------------------------------------------------------------
VaR <- simplify2array(sapply(d, function(d.)
    sapply(theta, function(th) VaR_hom_Par(alpha, d = d., shape = th, tol = tol, adjusted = TRUE)),
    simplify = FALSE))

## ------------------------------------------------------------------------
d <- 500
th <- 20
VaR_hom_Par(alpha, d = d, shape = th, trafo = TRUE) # Inf

## ------------------------------------------------------------------------
h <- function(x)
     (d/(1-th)-1)*x^(-1/th + 1) - (d-1)*x^(-1/th) + x - (d*th/(1-th) + 1)
interval <- init_interval(alpha, d, th, trafo = TRUE)
x <- uniroot(h, interval = interval)$root
(c <- (1-alpha)/(x+d-1)) # convert back to c-scale
a <- alpha+(d-1)*c
b <- 1-c
qPar(a, shape = th)*(d-1) + qPar(b, shape = th) # Inf
stopifnot(b == 1) # => b is 1 => qPar(b, shape = th) = Inf

## ------------------------------------------------------------------------
qPar(a, shape = th)*(d-1) + c^(-1/th)-1

## ------------------------------------------------------------------------
d <- seq(2, 1002, by = 20) # dimensions
theta <- c(0.1, 0.5, 1, 5, 10, 50) # theta values
VaR. <- simplify2array(sapply(d, function(d.)
    sapply(theta, function(th) VaR_hom_Par(alpha, d = d., shape = th,
                                           trafo = TRUE, adjusted = TRUE,
                                           avoid.cancellation = TRUE)),
    simplify = FALSE))

## ---- fig.align = "center", fig.width = 6, fig.height = 6, fig.show = "hold"----
ylim <- range(VaR, VaR.)
if(doPDF)
    pdf(file = (file <- paste0("fig_worst_VaR_",alpha,"_hom_comparison_num_problems.pdf")),
        width = 7, height = 7)
par(mar = c(5, 4+1, 4, 2) + 0.1) # increase space (for y axis label)
plot(d, VaR[1,], type = "l", ylim = ylim, log = "y", yaxt = "n", xlab = "d",
     ylab = as.expression(substitute(bar(VaR)[a](L^{"+"})~
            "directly (solid) or with transformed h (dashed) for Par("*theta*") margins",
            list(a = alpha))), col = cols[1])
eaxis(2)
for(k in 2:length(theta)) lines(d, VaR [k,], col = cols[k])
for(k in 1:length(theta)) lines(d, VaR.[k,], col = cols[k], lty = 2, lwd = 2)
legend("right", bty = "n",
       col = cols, lty = rep(1, length(theta)),
       legend = as.expression( lapply(1:length(theta), function(k)
           substitute(theta==th, list(th = theta[k]))) ))
if(doPDF) dev.off()

## ---- fig.align = "center", fig.width = 6, fig.height = 6, fig.show = "hold"----
## Generate samples
n <- 1000 # sample size
set.seed(271) # set a seed (for reproducibility)
X <- cbind(qPar(runif(n), shape = 2), # Par(2) sample
           qPar(runif(n), shape = 2.5)) # Par(2.5) sample
## Plot
if(doPDF)
    pdf(file = (file <- paste0("fig_RA_motivation_indep.pdf")),
        width = 6, height = 6)
plot(X, xlab = expression(X[1]), ylab = expression(X[2]))
if(doPDF) dev.off()

## ---- fig.align = "center", fig.width = 6, fig.height = 6, fig.show = "hold"----
## Generate samples
X. <- apply(X, 2, sort)
## Plot
if(doPDF)
    pdf(file = (file <- paste0("fig_RA_motivation_comonotone.pdf")),
        width = 6, height = 6)
plot(X., xlab = expression(X[1]), ylab = expression(X[2]))
if(doPDF) dev.off()

## ---- fig.align = "center", fig.width = 6, fig.height = 6, fig.show = "hold"----
## Samples of the sum of the components
## Note: Their mean is the same (unaffected by the dependence)
Xsum  <- rowSums(X)
Xsum. <- rowSums(X.)
## Quick plot
boxplot(Xsum, Xsum., log = "y", names = c("Independence", "Comonotonicity"))
## Kernel density estimates
ran <- range(X, X.)
dXsum  <- density(Xsum,  from = ran[1], to = ran[2])
dXsum. <- density(Xsum., from = ran[1], to = ran[2])
## Plot
if(doPDF)
    pdf(file = (file <- paste0("fig_RA_motivation_kernel_density_estimates.pdf")),
        width = 6, height = 6)
plot(dXsum, xlim = c(0, 5), ylim = c(0, max(dXsum$y, dXsum.$y)),
     xlab = "x", ylab = "Kernel density estimate at x", main = "", type = "l")
lines(dXsum., col = "royalblue3")
legend("topright", bty = "n", lty = 1,
       col = c("black", "royalblue3"), legend = c("Independence", "Comonotonicity"))
if(doPDF) dev.off()

## ------------------------------------------------------------------------
basic_rearrange_worst_VaR <- function(X, tol = 0)
{
    N <- nrow(X)
    d <- ncol(X)
    m.rs.old <- min(rowSums(X))
    Y <- X
    while (TRUE)
    {
        for(j in 1:d)
            Y[,j] <- sort(Y[,j], decreasing = TRUE)[rank(rowSums(Y[,-j, drop = FALSE]),
                                                         ties.method = "first")]
        Y.rs <- rowSums(Y)
        m.rs.new <- min(Y.rs)
        tol. <- abs((m.rs.new - m.rs.old)/m.rs.old)
        tol.reached <- if(is.null(tol)) {
            identical(Y, X)
        } else { tol. <= tol }
        if(tol.reached) {
            break
        } else {
            m.rs.old <- m.rs.new
            X <- Y
        }
    }
    min(rowSums(Y))
}

## ------------------------------------------------------------------------
## Build the input matrix (for worst VaR)
alpha <- 0.99 # confidence level
N <- 2^9 # number of discretization points; 512 here
p <- alpha + (1-alpha)*0:(N-1)/N # probabilities for evaluating marginal quantile functions
if(FALSE)
    d <- 2^(4:10) # 16, ..., 1024
d <- 2^(4:8) # dimensions 16, ..., 256 (to save time here)
res <- matrix(, nrow = length(d), ncol = 2) # matrix containing run time results
colnames(res) <- c("basic", "sophisticated")

## For each d, measure the run time (some randomness involved here...)
for(i in seq_along(d)) {
    mar <- rep(list(qF2), d[i]) # marginal quantile functions
    X <- sapply(mar, function(qF) qF(p)) # evaluate marginal quantile functions at p
    res[i,] <- c(system.time(basic_rearrange_worst_VaR(X))[["elapsed"]], # basic version
                 system.time(rearrange(X, sample = FALSE, is.sorted = TRUE))[["elapsed"]])
}

## ---- fig.align = "center", fig.width = 6, fig.height = 6, fig.show = "hold"----
if(doPDF)
    pdf(file = (file <- paste0("fig_ARA_speed-up.pdf")),
        width = 6, height = 6)
plot(d, (1-res[,2]/res[,1])*100, type = "b", log = "x", ylim = c(0,100),
     xlab = "d", ylab = "Relative speed-up (in %) of implemented ARA()")
if(doPDF) dev.off()

## ------------------------------------------------------------------------
A <- matrix(c(1:4, 2*(1:4)-1, 2^(0:3)), ncol = 3)
rearrange(A, tol = NULL, sample = FALSE, is.sorted = TRUE, trace = TRUE)

## ------------------------------------------------------------------------
B <- matrix(rep(1:3, 3), ncol = 3)
rearrange(B, tol = NULL, sample = FALSE, is.sorted = TRUE, trace = TRUE)

## ---- results = "hide"---------------------------------------------------
## Create a (N!)^{d-1}-list of all possible input matrices (with integer
## elements) and 1:N as first column.
N <- 5 # chosen N (<= 6 due to extensive run time)
x_perm <- permn(N) # N!-long list containing all possible permutations of 1:N
N. <- factorial(N)
mat <- vector("list", length = N.^2)
cnt <- 0
for (i in 1:N.) { # double 'for' not time critical here
    for (j in 1:N.){
        cnt <- cnt+1
        mat[[cnt]] <- cbind(1:N, x_perm[[i]], x_perm[[j]]) # matrix with 1:N in first column
    }
}

## Rearrange all these (unique) matrices
N. <- factorial(N)^2
system.time(matRAlst <- lapply(1:N., function(i) {
                ## if(i %% (N./20) == 0) cat(round(100*i/N.),"% done!\n", sep = "");
                rearrange(mat[[i]], tol = NULL, sample = FALSE)$X.rearranged
            }))

## Go through all rearranged matrices, unique()ify them and count
uniqueLst <- list(matRAlst[[1]])
freq <- c(1)
pb <- txtProgressBar(max = length(matRAlst), style = if(isatty(stdout())) 3 else 1) # setup progress bar
for(i in 2:length(matRAlst))
{
    bool <- sapply(1:length(uniqueLst),
                   function(k) { identical(matRAlst[[i]], uniqueLst[[k]]) }) # is uniqueLst[[k]] in matRAlst?
    if(any(bool)) { # matRAlst[[i]] has been observed before
        ind <- min(which(bool))
        freq[ind] <- freq[ind] + 1 # increase frequency
    } else { # matRAlst[[i]] has not been observed before
        uniqueLst <- c(uniqueLst, matRAlst[i]) # append it to uniqueLst
        freq <- c(freq, 1) # append its frequency
    }
    ## Progress
    setTxtProgressBar(pb, i) # update progress bar
}
close(pb) # close progress bar

## ---- fig.align = "center", fig.width = 6, fig.height = 6, fig.show = "hold"----
## Distribution of (final) rearranged matrices
(length(uniqueLst)/N.) * 100 # % of unique rearranged matrices
p.mat <- freq/N. # their corresponding probabilities
plot(p.mat, type = "l", xlab = "Index of unique matrices", ylab = "Probability")
## => Matrices earlier on tend to appear more often (by construction!)

## ---- fig.align = "center", fig.width = 6, fig.height = 6, fig.show = "hold"----
## Distribution of the minimal row sums (= worst VaR estimates)
VaR.est <- sapply(matRAlst, function(x) min(rowSums(x)))
plot(VaR.est)
table(VaR.est)/length(matRAlst) # probabilities

## ------------------------------------------------------------------------
data(SMI.12)
L <- -returns(SMI.12)
n <- nrow(L)
d <- ncol(L)

## ------------------------------------------------------------------------
res <- vector("list", length = d)
names(res) <- colnames(L)
for(k in seq_len(d)) { # iterate over constituents
    ## Determine the threshold for constituent k
    L. <- L[,k]
    thres <- quantile(L., probs = 0.8, names = FALSE) # threshold

    ## Fit a GPD to the excesses for constituent k
    is.exceed <- L. > thres
    p.exceed <- mean(is.exceed) # estimated threshold exceedance probability
    excess <- L.[is.exceed] - thres # excesses
    fit <- fit_GPD_MLE(excess) # fit a GPD to the excesses
    stopifnot(fit$converged == 0) # convergence check
    shape <- fit$par[["shape"]] # fitted shape xi
    scale <- fit$par[["scale"]] # fitted scale beta
    stopifnot(is.numeric(shape), is.numeric(scale), scale > 0) # sanity check

    ## Update res
    res[[k]] <- list(loss = L., excess = excess, p.exceed = p.exceed,
                     threshold = thres, shape = shape, scale = scale)
}

## ---- fig.align = "center", fig.width = 6, fig.height = 7, fig.show = "hold"----
if(doPDF)
    pdf(file = (file <- paste0("fig_worst_VaR_bounds_application_GPD_fit_check.pdf")),
        width = 6, height = 7)
## Graphical goodness-of-fit assessment
opar <- par(omd = c(0.02, 1, 0.02, 1), mar = rep(1, 4))
layout(matrix(1:d, ncol = 4, byrow = TRUE)) # (5, 4)-layout
for(k in 1:d) {
    x <- sort(res[[k]]$excess)
    qq_plot(x, FUN = function(p)
        qGPD(p, shape = res[[k]]$shape, scale = res[[k]]$scale),
        axes = FALSE, frame.plot = TRUE)
    mtext("Fitted quantiles", side = 1, line = 0.5, cex = 0.6)
    mtext("Empirical quantiles", side = 2, line = 0.5, cex = 0.6)
    op <- par(usr = c(0, 1, 0, 1))
    text(1/10, 9/10, names(res)[k], cex = 0.7, adj = 0)
    y <- qGPD(ppoints(length(x)), shape = res[[k]]$shape, scale = res[[k]]$scale)
    R2 <- sprintf("%.4f", cor(x, y)^2) # coefficient of determination R^2
    text(9/10, 1/10, substitute(R^2 == r2, list(r2 = R2)), cex = 0.7, adj = 1)
    par(op)
}
layout(1) # restore layout
par(opar) # restore plot parameters
if(doPDF) dev.off()

## ------------------------------------------------------------------------
alpha <- 0.99 # confidence level
stopifnot(sapply(res, function(r) r$p.exceed) >= 1 - alpha) # bar(F)(u) >= 1-alpha <=> F(u) <= alpha
## => This was clear (as our threshold was chosen as a lower quantile than alpha
##    but it is still good to check.
qF <- lapply(res, function(r) {
    function(p) qGPDtail(p, threshold = r$threshold,
                         p.exceed = r$p.exceed,
                         shape = r$shape, scale = r$scale)
}) # list of quantile functions of the EVT based loss distributions
set.seed(271) # set a seed (for reproducibility)
res.ARA <- ARA(alpha, qF = qF) # apply ARA()
stopifnot(res.ARA$converged) # check convergence
res.ARA$bounds # ARA bounds on worst VaR
res.RA <- RA(alpha, qF = qF, N = res.ARA$N.used, abstol = 0) # apply RA() (with the same N)
stopifnot(res.RA$converged) # check convergence
res.RA$bounds # RA bounds on worst VaR

## ------------------------------------------------------------------------
## Build the input matrices for rearrange()
N <- res.ARA$N.used
p.low <- alpha + (1-alpha)*(0:(N-1))/N # probability points for worst VaR (lower bound)
p.up  <- alpha + (1-alpha)*(1:N)/N # probability points for worst VaR (upper bound)
X.low <- sapply(qF, function(qF) qF(p.low)) # input matrix (lower bound)
X.up  <- sapply(qF, function(qF) qF(p.up)) # input matrix (upper bound)
X.up[N,] <- sapply(1:d, function(j) if(is.infinite(X.up[N,j]))
                   qF[[j]](alpha+(1-alpha)*(1-1/(2*N))) else X.up[N,j])

## Apply rearrange() for various tolerances (incl. NULL)
tol <- seq(0, 0.5, length.out = 21) # tolerances considered
res.low  <- sapply(tol, function(t) rearrange(X.low,  tol = t, sample = FALSE, is.sorted = TRUE)$bound)
res.low. <- rearrange(X.low, tol = NULL, sample = FALSE, is.sorted = TRUE)$bound # for tol = NULL
res.up  <- sapply(tol, function(t) rearrange(X.up, tol = t, sample = FALSE, is.sorted = TRUE)$bound)
res.up. <- rearrange(X.up, tol = NULL, sample = FALSE, is.sorted = TRUE)$bound # for tol = NULL

## ---- fig.align = "center", fig.width = 6, fig.height = 6, fig.show = "hold"----
## Plot the lower and upper bound on worst VaR as a function of the chosen tol
if(doPDF)
    pdf(file = (file <- paste0("fig_worst_VaR_bounds_application.pdf")),
        width = 6, height = 6)
par(mar = c(5, 4+1, 4, 2) + 0.1) # increase space (for y axis label)
plot(tol, res.low, type = "b", log = "y", ylim = range(res.low, res.low., res.up, res.up.),
     col = "royalblue3", xlab = "Relative tolerance tol of rearrange()",
     ylab = substitute("Bounds on"~bar(VaR)[a](L^{"+"}), list(a = alpha)))
points(0, res.low., pch = 3, col = "royalblue3") # draw tol = NULL result at 0, too (as '+')
lines(tol, res.up, type = "b")
points(0, res.up., pch = 3) # draw tol = NULL result at 0, too (as '+')
legend("topright", bty = "n", lty = rep(1,2),
       col = c("black", "royalblue3"), legend = c("Upper bound", "Lower bound"))
if(doPDF) dev.off()

## ---- fig.align = "center", fig.width = 6, fig.height = 6, fig.show = "hold"----
## Define parameters of the three margins
th <- 2.5 # Pareto parameter
m <- 10 # mean of the lognormal
v <- 20 # variance of the lognormal
s <- 4 # shape of the gamma underlying the loggamma
r <- 5 # rate of the gamma underlying the loggamma
## Define list of marginal dfs
qF <- list(qPar = function(p) (1 - p)^(-1/th) - 1,
           qLN  = function(p) qlnorm(p, meanlog = log(m)-log(1+v/m^2)/2,
                                          sdlog = sqrt(log(1+v/m^2))),
           qLG  = function(p) exp(qgamma(p, shape = s, rate = r)))
## Apply ARA()
set.seed(271) # for reproducibility
alpha <- 0.99 # confidence level
wVaR <- ARA(alpha, qF = qF) # compute worst VaR (bounds)
X <- wVaR[["X.rearranged"]]$up # extract rearranged matrix (upper bound)
U <- pobs(X) # compute pseudo-observations
colnames(U) <- c("U[1]", "U[2]", "U[3]")
## Plot
if(doPDF)
    pdf(file = (file <- paste0("fig_worst_VaR_worst_copula_sample.pdf")),
        width = 6, height = 6)
cloud2(U, screen = list(z = 15, x = -60)) # default 'screen': z = 40, x = -60
if(doPDF) dev.off()

