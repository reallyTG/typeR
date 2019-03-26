## ----include=FALSE-------------------------------------------------------
library("knitr")
opts_chunk$set(
  engine='R', tidy=FALSE, cache=TRUE, autodep=TRUE
)
render_sweave() # For JSS when using knitr
knitr::opts_chunk$set(fig.pos = 'ht!')

## ----preliminaries, echo=FALSE, results='hide'----------------------
options(prompt = "R> ", continue = "+  ", width = 70, useFancyQuotes = FALSE, scipen = 5)

## ----nl,message=FALSE-----------------------------------------------
library("hetGP")
nl <- function(par, X, Y) { 
  theta <- par[1:ncol(X)] 
  tau2 <- par[ncol(X) + 1] 
  n <- length(Y) 
  K <- cov_gen(X1 = X, theta = theta) + diag(tau2, n) 
  Ki <- solve(K) 
  ldetK <- determinant(K, logarithm = TRUE)$modulus 
  ll <- - (n / 2) * log(t(Y) %*% Ki %*% Y) - (1 / 2) * ldetK 
  return(-ll) 
}

## ----gnl------------------------------------------------------------
gnl <- function(par, X, Y) {
  n <- length(Y)
  theta <- par[1:ncol(X)]; tau2 <- par[ncol(X) + 1]
  K <- cov_gen(X1 = X, theta = theta) + diag(tau2, n); Ki <- solve(K)
  KiY <- Ki %*% Y
  dlltheta <- rep(NA, length(theta))
  for(k in 1:length(dlltheta)) {
    dotK <- K * as.matrix(dist(X[, k]))^2 / (theta[k]^2)
    dlltheta[k] <- (n / 2) * t(KiY) %*% dotK %*% KiY / (t(Y) %*% KiY) - 
      sum(diag(Ki %*% dotK)) / 2
  }
  dlltau2 <- (n / 2) * t(KiY) %*% KiY / (t(Y) %*% KiY) 
    - sum(diag(Ki)) / 2
  return(-c(dlltheta, dlltau2))
}

## ----exp2d----------------------------------------------------------
library("lhs")
X <- randomLHS(40, 2)
X <- rbind(X, X)
X[, 1] <- (X[, 1] - 0.5) * 6 + 1
X[, 2] <- (X[, 2] - 0.5) * 6 + 1
y <- X[, 1] * exp(-X[, 1]^2 - X[, 2]^2) + rnorm(nrow(X), sd = 0.01)

## ----exp2doptim-----------------------------------------------------
Lwr <- sqrt(.Machine$double.eps) 
Upr <- 10
out <- optim(c(rep(0.1, 2), 0.1 * var(y)), nl, gnl, method = "L-BFGS-B",
  lower = Lwr, upper = c(rep(Upr, 2), var(y)), X = X, Y = y)
out$par

## ----pred1----------------------------------------------------------
K <- cov_gen(X, theta = out$par[1:2]) + diag(out$par[3], nrow(X))
Ki <- solve(K)
nuhat <- drop(t(y) %*% Ki %*% y / nrow(X))

## ----xx-------------------------------------------------------------
xx <- seq(-2, 4, length = 40)
XX <- as.matrix(expand.grid(xx, xx))

## ----pred-----------------------------------------------------------
KXX <- cov_gen(XX, theta = out$par[1:2]) + diag(out$par[3], nrow(XX))
KX <- cov_gen(XX, X, theta = out$par[1:2])
mup <- KX %*% Ki %*% y
Sigmap <- nuhat * (KXX - KX %*% Ki %*% t(KX))

## ----exp2dp, fig.height=6, fig.width=12, fig.align='center', fig.cap="\\label{fig:exp2d}Example predictive surface from a GP.  Open circles are the training locations."----
sdp <- sqrt(diag(Sigmap))
par(mfrow = c(1,2))
cols <- heat.colors(128)
persp(xx, xx, matrix(mup, ncol = 40), theta = -30, phi = 30,
  main = "mean surface", xlab = "x1", ylab = "x2", zlab = "y")
image(xx, xx, matrix(sdp, ncol = length(xx)), main = "variance", 
  xlab = "x1", ylab = "x2", col = cols)
points(X[, 1], X[, 2])

## ----library--------------------------------------------------------
fit <- mleHomGP(X, y, rep(Lwr, 2), rep(Upr, 2), known = list(beta0 = 0),
  init = c(list(theta = rep(0.1, 2), g = 0.1 * var(y))))
c(fit$theta, fit$g)

## ----uf-------------------------------------------------------------
n <- 50
Xn <- matrix(runif(2 * n), ncol = 2)
Xn <- Xn[order(Xn[, 1]),]
ai <- c(8, 27, 38, 45)
mult <- rep(1, n); mult[ai] <- c(25, 30, 9, 40)
XN <- Xn[rep(1:n, times = mult),]
N <- sum(mult)

## ----ufK------------------------------------------------------------
KN <- cov_gen(XN, theta = 0.2)
Kn <- cov_gen(Xn, theta = 0.2)

## ----wood-----------------------------------------------------------
U <- c(1, rep(0, n - 1))
for(i in 2:n){
  tmp <- rep(0, n)
  tmp[i] <- 1
  U <- rbind(U, matrix(rep(tmp, times = mult[i]), nrow = mult[i],
    byrow = TRUE))
}
U <- U[, n:1]

## ----fwood, fig.height=3.75, fig.width=9, fig.cap="\\label{fig:wood}Example mapping of $\\Kn \\rightarrow \\mathbf{U} \\rightarrow \\KN$ through the Woodbury identities."----
layout(matrix(c(1, 2, 3), 1, 3, byrow = TRUE), widths = c(2, 1, 2))
par(mar = c(5, 4, 3, 2))
image(Kn, x = 1:n, y = 1:n, main = "unique-n: Kn", xlab = "1:n",
  ylab = "1:n")
image(t(U), x = 1:n, y = 1:N, asp = 1, main = "U", xlab = "1:n",
  ylab = "1:N")
image(KN, x = 1:N, y = 1:N, main = "full-N: KN", xlab = "1:N",
  ylab = "1:N")

## ----speedup1,cache=TRUE--------------------------------------------
Xbar <- randomLHS(100, 2)
Xbar[, 1] <- (Xbar[, 1] - 0.5) * 6 + 1
Xbar[, 2] <- (Xbar[, 2] - 0.5) * 6 + 1
ytrue <- Xbar[, 1] * exp(-Xbar[, 1]^2 - Xbar[, 2]^2)
a <- sample(1:50, 100, replace = TRUE)
N <- sum(a)
X <- matrix(NA, ncol = 2, nrow = N)
y <- rep(NA, N)
nf <- 0
for(i in 1:100) {
  X[(nf + 1):(nf + a[i]),] <- matrix(rep(Xbar[i,], a[i]), ncol = 2,
    byrow = TRUE)
  y[(nf + 1):(nf + a[i])] <- ytrue[i] + rnorm(a[i], sd = 0.01)
  nf <- nf + a[i]
}

## ----speedup2, cache=TRUE-------------------------------------------
fN <- mleHomGP(list(X0 = X, Z0 = y, mult = rep(1, N)), y, rep(Lwr, 2), 
  rep(Upr, 2))
un <- mleHomGP(X, y, rep(Lwr, 2), rep(Upr, 2))

## ----times----------------------------------------------------------
c(fN = fN$time, un = un$time)

## ----estimates------------------------------------------------------
rbind(fN = fN$theta, un = un$theta)

## ----motofit--------------------------------------------------------
library("MASS")
hom <- mleHomGP(mcycle$times, mcycle$accel)

## ----motopred-------------------------------------------------------
Xgrid <- matrix(seq(0, 60, length = 301), ncol = 1)
p <- predict(x = Xgrid, object = hom)

## ----motofig, fig.height=5, fig.width=5, out.width="4in", out.height="4in", fig.align='center', fig.cap="\\label{fig:moto1}Homoskedastic GP fit to the motorcycle data via mean (solid red) and 95\\% error bars (dashed red)."----
plot(mcycle, main = "Predictive Surface")
lines(Xgrid, p$mean, col = 2, lwd = 2)
lines(Xgrid, qnorm(0.05, p$mean, sqrt(p$sd2 + p$nugs)), col = 2, lty = 2)
lines(Xgrid, qnorm(0.95, p$mean, sqrt(p$sd2 + p$nugs)), col = 2, lty = 2)

## ----motor2---------------------------------------------------------
het2 <- mleHetGP(mcycle$times, mcycle$accel, covtype = "Matern5_2",
  lower = 15, upper = 50, settings = list(initStrategy = 'smoothed'))
het2$time

## ----moto2pred------------------------------------------------------
p2 <- predict(het2, Xgrid)
ql <- qnorm(0.05, p2$mean, sqrt(p2$sd2 + p2$nugs))
qu <- qnorm(0.95, p2$mean, sqrt(p2$sd2 + p2$nugs))

## ----motor3, fig.height=6, fig.width=12, fig.align='center', fig.cap="\\label{fig:moto2}Heteroskedastic GP fit to the motorcycle data.  Left panel shows the predictive distribution via mean (solid red) and 90\\% error bars (dashed red).  Right panel shows the estimated variance surface and moment-based estimates of variance."----
par(mfrow = c(1, 2))
plot(mcycle$times, mcycle$accel, ylim = c(-160, 90), ylab = "acc",
  xlab = "time", main = "Predictive Surface")
lines(Xgrid, p2$mean, col = 2, lwd = 2)
lines(Xgrid, ql, col = 2, lty = 2)
lines(Xgrid, qu, col = 2, lty = 2)
plot(Xgrid, p2$nugs, type = "l", lwd = 2, ylab = "s2", xlab = "time", 
  main = "Variance Surface", ylim = c(0, 2e3))
points(het2$X0, sapply(find_reps(mcycle[, 1], mcycle[, 2])$Zlist, var), 
  col = 3, pch = 20)

## ----sirdesign,cache=TRUE-------------------------------------------
Xbar <- randomLHS(200, 2)
a <- sample(1:100, nrow(Xbar), replace = TRUE)
X <- matrix(NA, ncol = 2, nrow = sum(a))
nf <- 0
for(i in 1:nrow(Xbar)) {
  X[(nf + 1):(nf + a[i]),] <- matrix(rep(Xbar[i,], a[i]), ncol = 2,
    byrow = TRUE)
  nf <- nf + a[i]
}
nf

## ----sireval,cache=TRUE---------------------------------------------
Y <- apply(X, 1, sirEval)

## ----sirfit,cache=TRUE----------------------------------------------
fit <- mleHetGP(X, Y, lower = rep(0.05, 2), upper = rep(10, 2), 
  settings = list(linkThetas = "none"), covtype = "Matern5_2", maxit = 1e4)
fit$time

## ----sirpred--------------------------------------------------------
xx <- seq(0, 1, length = 100)
XX <- as.matrix(expand.grid(xx, xx))
p <- predict(fit, XX)
psd <- sqrt(p$sd2 + p$nugs)

## ----sirvis, fig.height=6, fig.width=12, fig.align='center', fig.cap="\\label{fig:sir}Heteroskedastic GP fit to the SIR data.  Left panel shows the predictive mean surface; right panel shows the estimated standard deviation.  Text in both panels shows numbers of replicates."----
par(mfrow = c(1, 2))
cols <- terrain.colors(128)
image(xx, xx, matrix(p$mean, 100), xlab = "S0", ylab = "I0", col = cols,
  main = "Mean Infected")
text(Xbar, labels = a, cex = 0.75)
image(xx, xx, matrix(psd, 100), xlab = "S0", ylab = "I0", col = cols,
  main = "SD Infected")
text(Xbar, labels = a, cex = 0.75)

## ----loadbf---------------------------------------------------------
data("bfs")
thetas <- matrix(bfs.exp$theta, ncol = 1)
bfs <- as.matrix(t(bfs.exp[, -1]))

## ----fitbf----------------------------------------------------------
bfs1 <- mleHetTP(X = list(X0 = log10(thetas), Z0 = colMeans(log(bfs)),
  mult = rep(nrow(bfs), ncol(bfs))), Z = log(as.numeric(bfs)),
  lower = 10^(-4), upper = 5, covtype = "Matern5_2")

## ----predbf---------------------------------------------------------
dx <- seq(0, 1, length = 100)
dx <- 10^(dx * 4 - 3)
p <- predict(bfs1, matrix(log10(dx), ncol = 1))

## ----visbf, fig.height=6, fig.width=6, out.width="4in", out.height="4in", fig.align='center', fig.cap="Heteroskedastic TP fit to the Bayes factor data under exponential hyperprior."----
matplot(log10(thetas), t(log(bfs)), col = 1, pch = 21, ylab = "log(bf)", 
  main = "Bayes factor surface")
lines(log10(dx), p$mean, lwd = 2, col = 2)
lines(log10(dx), p$mean + 2 * sqrt(p$sd2 + p$nugs), col = 2, lty = 2,
  lwd = 2)
lines(log10(dx), p$mean - 2 * sqrt(p$sd2 + p$nugs), col = 2, lty = 2,
  lwd = 2)
legend("topleft", c("hetTP mean", "hetTP interval"), col = 2, lty = 1:2,
  lwd = 2)

## ----loadbf2--------------------------------------------------------
D <- as.matrix(bfs.gamma[, 1:2])
bfs <- as.matrix(t(bfs.gamma[, -(1:2)]))

## ----fitbf2---------------------------------------------------------
bfs2 <- mleHetTP(X=list(X0 = log10(D), Z0 = colMeans(log(bfs)), 
  mult = rep(nrow(bfs), ncol(bfs))), Z = log(as.numeric(bfs)), 
  lower = rep(10^(-4), 2), upper = rep(5, 2), covtype = "Matern5_2")

## ----predbf2--------------------------------------------------------
dx <- seq(0, 1, length = 100)
dx <- 10^(dx * 4 - 3)
DD <- as.matrix(expand.grid(dx, dx))
p <- predict(bfs2, log10(DD))

## ----visbf2, fig.height=6, fig.width=12, fig.align='center', fig.cap="Heteroskedastic TP fit to the Bayes factor data under Gamma hyperprior."----
par(mfrow = c(1, 2))
mbfs <- colMeans(bfs)
image(log10(dx), log10(dx), t(matrix(p$mean, ncol=length(dx))),  
  col = heat.colors(128), xlab = "log10 alpha", ylab = "log10 beta", 
  main = "mean log BF")
text(log10(D[, 2]), log10(D[, 1]), signif(log(mbfs), 2), cex = 0.5)
contour(log10(dx), log10(dx), t(matrix(p$mean, ncol = length(dx))),
  levels = c(-5, -3, -1, 0, 1, 3, 5), add = TRUE, col = 4)
image(log10(dx), log10(dx), t(matrix(sqrt(p$sd2 + p$nugs), 
  ncol = length(dx))), col = heat.colors(128), xlab = "log10 alpha", 
  ylab = "log10 beta", main = "sd log BF")
text(log10(D[, 2]), log10(D[, 1]), signif(apply(log(bfs), 2, sd), 2),
  cex = 0.5)

## ----atoload,cache=TRUE---------------------------------------------
data("ato")

## ----atotime--------------------------------------------------------
c(n = nrow(Xtrain), N = length(unlist(Ztrain)), time = out$time)

## ----atotestscore---------------------------------------------------
phet <- predict(out, Xtest)
phets2 <- phet$sd2 + phet$nugs
mhet <- as.numeric(t(matrix(rep(phet$mean, 10), ncol = 10)))
s2het <- as.numeric(t(matrix(rep(phets2, 10), ncol = 10)))
sehet <- (unlist(t(Ztest)) - mhet)^2
sc <- - sehet/s2het - log(s2het)
mean(sc)

## ----atotrainscore--------------------------------------------------
phet.out <- predict(out, Xtrain.out)
phets2.out <- phet.out$sd2 + phet.out$nugs
s2het.out <- mhet.out <- Ztrain.out
for(i in 1:length(mhet.out)) {
  mhet.out[[i]] <- rep(phet.out$mean[i], length(mhet.out[[i]]))
  s2het.out[[i]] <- rep(phets2.out[i], length(s2het.out[[i]]))
}
mhet.out <- unlist(t(mhet.out))
s2het.out <- unlist(t(s2het.out))
sehet.out <- (unlist(t(Ztrain.out)) - mhet.out)^2
sc.out <- - sehet.out/s2het.out - log(s2het.out)
mean(sc.out)

## ----atobothscore---------------------------------------------------
mean(c(sc, sc.out))

## ----twors----------------------------------------------------------
rn <- c(4.5, 5.5, 6.5, 6, 3.5)
X0 <- matrix(seq(0.05, 0.95, length.out = length(rn)))
X1 <- matrix(c(X0, 0.2, 0.4))
Y1 <- c(rn, 5.2, 6.3)
r1 <- splinefun(x = X1, y = Y1, method = "natural")
X2 <- matrix(c(X0, 0.0, 0.3))
Y2 <- c(rn, 7, 4)
r2 <- splinefun(x = X2, y = Y2, method = "natural")

## ----twovarsXX------------------------------------------------------
XX <- matrix(seq(0, 1, by = 0.005))

## ----tworsfig, fig.height=5, fig.width=5, fig.show='hide'-----------
plot(X0, rn, xlab = "x", ylab = "r(x)", xlim = c(0, 1), ylim = c(2, 8), 
  col = 2, main = "Two Variance Hypotheses")
lines(XX, r1(XX), col = 3)
lines(XX, r2(XX), col = 4)

## ----imspe.r--------------------------------------------------------
IMSPE.r <- function(x, X0, theta, r) {
  x <- matrix(x, nrow = 1)
  Wijs <- Wij(mu1 = rbind(X0, x), theta = theta, type = "Gaussian")
  K <- cov_gen(X1 = rbind(X0, x), theta = theta)
  K <- K + diag(apply(rbind(X0, x), 1, r))
  return(1 - sum(solve(K) * Wijs))
}

## ----twoimspe-------------------------------------------------------
imspe1 <- apply(XX, 1, IMSPE.r, X0 = X0, theta = 0.25, r = r1)
imspe2 <- apply(XX, 1, IMSPE.r, X0 = X0, theta = 0.25, r = r2)
xstar1 <- which.min(imspe1)
xstar2 <- which.min(imspe2)

## ----twoimspefig, fig.height=5, fig.width=5, fig.show='hide'--------
plot(XX, imspe1, type = "l", col = 3, ylab = "IMSPE", xlab = "x", 
  ylim = c(0.6, 0.7), main = "IMSPE for two variances")
lines(XX, imspe2, col = 4)
abline(v = X0, lty = 3, col = 'red')
points(XX[xstar1], imspe1[xstar1], pch = 23, bg = 3)
points(XX[xstar2], imspe2[xstar2], pch = 23, bg = 4)

## ----rx-------------------------------------------------------------
rx <- function(x, X0, rn, theta, Ki, kstar, Wijs) {  
  x <- matrix(x, nrow = 1); kn1 <- cov_gen(x, X0, theta = theta)
  wn <- Wij(mu1 = x, mu2 = X0, theta = theta, type = "Gaussian")
  a <- kn1 %*% Ki %*% Wijs %*% Ki %*% t(kn1) - 2*wn %*% Ki %*% t(kn1) 
  a <- a + Wij(mu1 = x, theta = theta, type = "Gaussian")
  Bk <- tcrossprod(Ki[, kstar], Ki[kstar,]) / 
    (2 / rn[kstar] - Ki[kstar, kstar])
  b <- sum(Bk * Wijs); sn <- 1 - kn1 %*% Ki %*% t(kn1) 
  return(a / b - sn)
}

## ----rxeval---------------------------------------------------------
bestk <- which.min(apply(X0, 1, IMSPE.r, X0 = X0, theta = 0.25, r = r1))
Wijs <- Wij(X0, theta = 0.25, type = "Gaussian")
Ki <- solve(cov_gen(X0, theta = 0.25, type = "Gaussian") + diag(rn))
rx.thresh <- apply(XX, 1, rx, X0 = X0, rn = rn, theta = 0.25, Ki = Ki,
  kstar = bestk, Wijs = Wijs)

## ----twoimspefig2, fig.height=5, fig.width=5, out.width="3in", out.height="3in", fig.align='center', fig.cap="\\label{fig:twoimspe2}IMSPE calculations for two variance hypotheses, with replicating threshold added in gray."----
plot(X0, rn, xlab = "x", ylab = "r(x)", xlim = c(0, 1), ylim = c(2, 8),
  lty = 2, col = 2, main = "Which variance is large enough?")
lines(XX, r1(XX), col = 3); lines(XX, r2(XX), col = 4)
lines(XX, rx.thresh, lty = 2, col = "darkgrey")

## ----forr-----------------------------------------------------------
fn <- function(x) { (1.1 + sin(x * 2 * pi)) }
fr <- function(x) { f1d(x) + rnorm(length(x), sd = fn(x)) }

## ----forrinit,cache=TRUE--------------------------------------------
X <- seq(0, 1, length = 10)
Y <- fr(X)
mod <- mleHetGP(X = X, Z = Y, lower = 0.0001, upper = 10)

## ----forrIMSPE,cache=TRUE-------------------------------------------
opt <- IMSPE_optim(mod, h = 5) 
c(X, opt$par)

## ----forrupdate-----------------------------------------------------
X <- c(X, opt$par)
Ynew <- fr(opt$par)
Y <- c(Y, Ynew) 
mod <- update(mod, Xnew = opt$par, Znew = Ynew, ginit = mod$g * 1.01)

## ----forr500, cache=TRUE--------------------------------------------
for(i in 1:489) {
  opt <- IMSPE_optim(mod, h = 5)
  X <- c(X, opt$par)
  Ynew <- fr(opt$par)
  Y <- c(Y, Ynew)
  mod <- update(mod, Xnew = opt$par, Znew = Ynew, ginit = mod$g * 1.01)
  if(i %% 25 == 0){ 
    mod2 <- mleHetGP(X = list(X0 = mod$X0, Z0 = mod$Z0, mult = mod$mult),
    Z = mod$Z, lower = 0.0001, upper = 1)
    if(mod2$ll > mod$ll) mod <- mod2
  } 
}
nrow(mod$X0)

## ----forrpred-------------------------------------------------------
xgrid <- seq(0, 1, length = 1000)
p <- predict(mod, matrix(xgrid, ncol = 1)) 
pvar <- p$sd2 + p$nugs

## ----forrfig, fig.height=5, fig.width=6, out.width="5in", out.height="4.2in", fig.align='center', fig.cap="\\label{fig:forr}Sequential design with horizon $h=5$.  The truth is in black and the predictive distribution in red."----
plot(xgrid, f1d(xgrid), type = "l", xlab = "x", ylab = "y", 
  main="Forrester Example, IMSPE h=5", ylim = c(-8, 18))
lines(xgrid, qnorm(0.05, f1d(xgrid), fn(xgrid)), col = 1, lty = 2)
lines(xgrid, qnorm(0.95, f1d(xgrid), fn(xgrid)), col = 1, lty = 2)
points(X, Y)
segments(mod$X0, rep(0, nrow(mod$X0)) - 8, mod$X0, (mod$mult - 8) * 0.5, 
  col = "gray")
lines(xgrid, p$mean, col = 2)
lines(xgrid, qnorm(0.05, p$mean, sqrt(pvar)), col = 2, lty = 2)
lines(xgrid, qnorm(0.95, p$mean, sqrt(pvar)), col = 2, lty = 2)
legend("top", c("truth", "estimate"), col = 1:2, lty = 1:2)

## ----adapt, cache=TRUE----------------------------------------------
X <- seq(0, 1, length = 10)
Y <- fr(X)
mod.a <- mleHetGP(X = X, Z = Y, lower = 0.0001, upper = 10)
h <- rep(NA, 500)

## ----adapt2, cache=TRUE---------------------------------------------
for(i in 1:490) {
  h[i] <- horizon(mod.a)
  
  opt <- IMSPE_optim(mod.a, h = h[i])
  X <- c(X, opt$par)
  Ynew <- fr(opt$par)
  Y <- c(Y, Ynew)
  mod.a <- update(mod.a, Xnew = opt$par, Znew = Ynew,
    ginit = mod.a$g * 1.01)
  
  if(i %% 25 == 0){ 
    mod2 <- mleHetGP(X = list(X0 = mod.a$X0, Z0 = mod.a$Z0,
      mult = mod.a$mult), Z = mod.a$Z, lower = 0.0001, upper = 1)
    if(mod2$ll > mod.a$ll) mod.a <- mod2
  } 
}

## ----adapt3, cache=TRUE---------------------------------------------
p.a <- predict(mod.a, matrix(xgrid, ncol = 1))
pvar.a <- p.a$sd2 + p.a$nugs

## ----adapfig, fig.height=4, fig.width=8, out.width="6in", out.height="3in", fig.align='center', fig.cap="\\label{fig:adapt}{\\em Left:} Horizons chosen per iteration; {\\em right:} final design and predictions versus the truth, similar to Figure \\ref{fig:forr}"----
par(mfrow = c(1, 2))
plot(h, main = "Horizon", xlab = "Iteration")
plot(xgrid, f1d(xgrid), type = "l", xlab = "x", ylab = "y",
  main = "Adaptive Horizon Design", ylim = c(-8, 18))
lines(xgrid, qnorm(0.05, f1d(xgrid), fn(xgrid)), col = 1, lty = 2)
lines(xgrid, qnorm(0.95, f1d(xgrid), fn(xgrid)), col = 1, lty = 2)
points(X, Y)
segments(mod$X0, rep(0, nrow(mod$X0)) - 8, mod$X0, (mod$mult - 8) * 0.5, 
  col = "gray")
lines(xgrid, p$mean, col = 2)
lines(xgrid, qnorm(0.05, p$mean, sqrt(pvar.a)), col = 2, lty = 2)
lines(xgrid, qnorm(0.95, p$mean, sqrt(pvar.a)), col = 2, lty = 2)

## ----adaptn---------------------------------------------------------
nrow(mod.a$X0)

## ----rmsescore------------------------------------------------------
ytrue <- f1d(xgrid)
yy <- fr(xgrid)
rbind(rmse = c(h5 = mean((ytrue - p$mean)^2), 
  ha = mean((ytrue - p.a$mean)^2)), 
  score = c(h5 = - mean((yy - p$mean)^2 / (pvar) + log(pvar)), 
  ha = -mean((yy - p.a$mean)^2 / pvar.a + log(pvar.a))))

## ----atoatime-------------------------------------------------------
c(n = nrow(out.a$X0), N = length(out.a$Z), time = out.a$time)

## ----atoatestscore--------------------------------------------------
phet.a <- predict(out.a, Xtest)
phets2.a <- phet.a$sd2 + phet.a$nugs
mhet.a <- as.numeric(t(matrix(rep(phet.a$mean, 10), ncol = 10)))
s2het.a <- as.numeric(t(matrix(rep(phets2.a, 10), ncol = 10)))
sehet.a <- (unlist(t(Ztest)) - mhet.a)^2
sc.a <- - sehet.a/s2het.a - log(s2het.a)
c(batch = mean(sc), adaptive = mean(sc.a))

## ----atorebuild-----------------------------------------------------
out.a <- rebuild(out.a)

## ----atoadapt,cache=TRUE--------------------------------------------
Wijs <- Wij(out.a$X0, theta = out.a$theta, type = out.a$covtype)
h <- horizon(out.a, Wijs = Wijs)
control <- list(tol_dist = 1e-4, tol_diff = 1e-4, multi.start = 30)
opt <- IMSPE_optim(out.a, h, Wijs = Wijs, control = control)

## ----atoopt---------------------------------------------------------
opt$par

## ----atooptunique---------------------------------------------------
opt$path[[1]]$new

## ----EIahead, cache=TRUE--------------------------------------------
X <- seq(0, 1, length = 10)
X <- c(X, X)
Y <- fr(X)
mod <- mleHetGP(X = X, Z = Y, lower = 0.0001, upper = 10)

## ----EIahead2, cache=TRUE-------------------------------------------
for(i in 1:480) {
  opt <- crit_optim(mod, crit = "crit_EI", h = 5)
  X <- c(X, opt$par)
  Ynew <- fr(opt$par)
  Y <- c(Y, Ynew)
  mod <- update(mod, Xnew = opt$par, Znew = Ynew, ginit = mod$g * 1.01)
  
  if(i %% 25 == 0){
    mod2 <- mleHetGP(X = list(X0 = mod$X0, Z0 = mod$Z0, mult = mod$mult),
      Z = mod$Z, lower = 0.0001, upper = 1)
    if(mod2$ll > mod$ll) mod <- mod2
  }
}

## ----EIahead3, cache=TRUE-------------------------------------------
p <- predict(mod, matrix(xgrid, ncol = 1))
pvar <- p$sd2 + p$nugs

## ----EIgraphs, fig.height=5, fig.width=6, out.width="5in", out.height="4.2in", fig.align='center', fig.cap="\\label{fig:ei} Sequential optimization with horizon $h = 5$. The truth is in black and the predictive distribution in red ."----
plot(xgrid, f1d(xgrid), type = "l", xlab = "x", ylab = "y",
  ylim = c(-6, 17), main = "Forrester example with EI, h = 5")
lines(xgrid, qnorm(0.05, f1d(xgrid), fn(xgrid)), col = 1, lty = 2)
lines(xgrid, qnorm(0.95, f1d(xgrid), fn(xgrid)), col = 1, lty = 2)
points(X, Y)
segments(mod$X0, rep(0, nrow(mod$X0)) - 6, mod$X0, (mod$mult - 6) * 0.5,
  col = "gray")
lines(xgrid, p$mean, col = 2)
lines(xgrid, qnorm(0.05, p$mean, sqrt(pvar)), col = 2, lty = 2)
lines(xgrid, qnorm(0.95, p$mean, sqrt(pvar)), col = 2, lty = 2)
legend("top", c("truth", "estimate"), col = 1:2, lty = 1:2)

## ----EIreps---------------------------------------------------------
nrow(mod$X0)

## ----Contour_ahead--------------------------------------------------
X <- seq(0, 1, length = 10)
X <- c(X, X)
Y <- fr(X)
mod <- mleHetGP(X = X, Z = Y, lower = 0.0001, upper = 10)

for(i in 1:480) {
  opt <- crit_optim(mod, crit = "crit_cSUR", h = 5)
  X <- c(X, opt$par)
  Ynew <- fr(opt$par)
  Y <- c(Y, Ynew)
  mod <- update(mod, Xnew = opt$par, Znew = Ynew, ginit = mod$g * 1.01)
  
  if(i %% 25 == 0){
    mod2 <- mleHetGP(X = list(X0 = mod$X0, Z0 = mod$Z0, mult = mod$mult),
      Z = mod$Z, lower = 0.0001, upper = 1)
    if(mod2$ll > mod$ll) mod <- mod2
  }
}

p <- predict(mod, matrix(xgrid, ncol = 1))
pvar <- p$sd2 + p$nugs

## ----contour_n------------------------------------------------------
nrow(mod$X0)

## ----cSURgraphs, fig.height=5, fig.width=6, out.width="5in", out.height="4.2in", fig.align='center', fig.cap="\\label{fig:contour} Sequential contour finding with horizon $h = 5$. The truth is in black and the predictive distribution in red."----
plot(xgrid, f1d(xgrid), type = "l", xlab = "x", ylab = "y", 
  ylim = c(-6, 17), main="Forrester example with cSUR, h = 5")
lines(xgrid, qnorm(0.05, f1d(xgrid), fn(xgrid)), col = 1, lty = 2)
lines(xgrid, qnorm(0.95, f1d(xgrid), fn(xgrid)), col = 1, lty = 2)
points(X, Y)
segments(mod$X0, rep(0, nrow(mod$X0)) - 6, mod$X0, (mod$mult - 6) * 0.5,
  col="gray")
lines(xgrid, p$mean, col = 2)
lines(xgrid, qnorm(0.05, p$mean, sqrt(pvar)), col = 2, lty = 2)
lines(xgrid, qnorm(0.95, p$mean, sqrt(pvar)), col = 2, lty = 2)
legend("top", c("truth", "estimate"), col = 1:2, lty = 1:2)
abline(h = 0, col = "blue")

