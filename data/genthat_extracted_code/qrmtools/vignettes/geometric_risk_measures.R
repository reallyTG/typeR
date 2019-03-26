## ---- message = FALSE----------------------------------------------------
library(qrmtools)
library(copula)
library(sn) # for skew-normal distribution
library(RColorBrewer) # for Dark2 color palette
col <- brewer.pal(8, name = "Dark2")[c(7, 3, 5, 4, 6)] # some colors

## ------------------------------------------------------------------------
## Setup
lphi <- 33 # number of angles
phi <- seq(0, 2*pi, length.out = lphi) # equidistant angles
circle <- cbind(cos(phi), sin(phi)) # unit circle evaluated at angles
a1 <- 0.98 * circle # first set of alphas
a2 <- cbind(0.98 * circle[,1], 0.9 * circle[,2]) # other set of alphas

## ---- fig.align = "center", fig.width = 6, fig.height = 6----------------
## Plot
par(pty = "s")
plot(circle, type = "l", lty = 2, lwd = 2, col = gray(0.5),
     xlab = expression(alpha[1]), ylab = expression(alpha[2]),
     xlim = c(-1, 1), ylim = c(-1, 1)) # gray circle
abline(v = 0, h = 0, lty = 5) # alpha_1 = 0 and alpha_2 = 0
lines(a1[,1], a1[,2], lwd = 2, col = col[1]) # first set of alphas
lines(a2[,1], a2[,2], lwd = 2, col = col[2]) # other set of alphas
p1 <- 0.98 * c(cos(3/4*pi), sin(3/4*pi)) # location of "1"
p2 <- c(0.98 * cos(1/4*pi), 0.90 * sin(1/4*pi)) # location of "2"
arrows(0, 0, p1[1], p1[2], lwd = 2, col = col[1]) # arrow to "1"
arrows(0, 0, p2[1], p2[2], lwd = 2, col = col[2]) # arrow to "2"
points(p1[1], p1[2], pch = "1", cex = 1.2) # "1"
points(p2[1], p2[2], pch = "2", cex = 1.2) # "2"
points(0, 0, pch = 19, cex = 1.2) # filled dot

## ------------------------------------------------------------------------
## Generate a copula sample
set.seed(42) # for reproducibility
n <- 2e3 # sample size
cop <- gumbelCopula(iTau(gumbelCopula(), tau = 0.5)) # Gumbel copula
U <- rCopula(n, copula = cop) # sample
## Map to skew-normal and t_4 margins
xi <- -1; om <- 1; al <- 2 # parameters for skew-normal margin
nu <- 4 # parameter for t margin
X <- cbind(qsn(U[,1], xi = xi, omega = om, alpha = al),
            qt(U[,2], df = nu)) # map to skew-normal and t_4 margins

## ------------------------------------------------------------------------
## Evaluate the joint density (according to Sklar's Theorem)
x <- seq(-4, 4, length.out = 64)
y <- seq(-4, 4, length.out = 64)
dH <- function(x, y)
    dCopula(cbind(psn(x, xi = xi, omega = om, alpha = al), pt(y, df = nu)),
            copula = cop) * dsn(x, xi = xi, omega = om, alpha = al) * dt(y, df = nu)
h <- outer(x, y, FUN = dH)

## ------------------------------------------------------------------------
## Compute geometric VaR and expectile for both sets of indices alpha
gVaR.a1 <- matrix(vapply(gVaR(X, level = a1), `[[`, numeric(2), "par"),
                  ncol = 2, byrow = TRUE)
gEX.a1  <- matrix(vapply(gEX (X, level = a1), `[[`, numeric(2), "par"),
                  ncol = 2, byrow = TRUE)
gVaR.a2 <- matrix(vapply(gVaR(X, level = a2), `[[`, numeric(2), "par"),
                  ncol = 2, byrow = TRUE)
gEX.a2  <- matrix(vapply(gEX (X, level = a2), `[[`, numeric(2), "par"),
                  ncol = 2, byrow = TRUE)

## ------------------------------------------------------------------------
## Compute geometric VaR and expectile for the points p1 and p2
gVaR.p1 <- gVaR(X, level = p1)$par
gEX.p1  <-  gEX(X, level = p1)$par
gVaR.p2 <- gVaR(X, level = p2)$par
gEX.p2  <-  gEX(X, level = p2)$par

## ---- fig.align = "center", fig.width = 6, fig.height = 6----------------
## Plot
par(pty = "s")
ran <- range(gVaR.a1, gVaR.a2, gEX.a1, gEX.a2,
             gVaR.p1, gVaR.p2, gEX.p1, gEX.p2) # determine plotting range
plot(NA, type = "l", xlim = ran, ylim = ran,
     xlab = "Component 1 of geometric VaRs and expectiles",
     ylab = "Component 2 of geometric VaRs and expectiles") # set up plot region
abline(v = 0, h = 0, lty = 5)
contour(x, y, h, nlevels = 12, col = gray(0.7), add = TRUE)
lines(gVaR.a1, lwd = 2, col = col[1], lty = 2) # geometric VaRs for alpha = a1
lines(gVaR.a2, lwd = 2, col = col[2], lty = 2) # geometric VaRs for alpha = a2
lines(gEX.a1,  lwd = 2, col = col[1]) # geometric expectiles for alpha = a1
lines(gEX.a2,  lwd = 2, col = col[2]) # geometric expectiles for alpha = a2
points(rbind(gVaR.p1), pch = "1", cex = 1.2) # geometric VaR for alpha = p1
points(rbind(gVaR.p2), pch = "2", cex = 1.2) # geometric VaR for alpha = p2
points(rbind(gEX.p1),  pch = "1", cex = 1.2) # geometric expectiles for alpha = p1
points(rbind(gEX.p2),  pch = "2", cex = 1.2) # geometric expectiles for alpha = p2
points(rbind(colMeans(X)), pch = 19, cex = 1.2) # filled dot

## ------------------------------------------------------------------------
## Bootstrap
B <- 32 # bootstrap replications
n <- 250 # sample size
res <- lapply(1:B, function(b) { # iterate over 1:B
    U <- rCopula(n, copula = cop) # sample copula
    X <- cbind(qsn(U[,1], xi = xi, omega = om, alpha = al),
               qt(U[,2], df = nu)) # map to skew-normal and t_4 margins
    matrix(vapply(gEX(X, level = a1), `[[`, numeric(2), "par"), ncol = 2,
           byrow = TRUE)
})

## ---- fig.align = "center", fig.width = 6, fig.height = 6----------------
## Plot
par(pty = "s")
ran <- range(gEX.a1, res) # determine plotting range
plot(NA, type = "l", xlim = ran, ylim = ran,
     xlab = "Component 1 of geometric expectiles",
     ylab = "Component 2 of geometric expectiles") # set up plot region
abline(v = 0, h = 0, lty = 5)
contour(x, y, h, nlevels = 12, col = gray(0.7), add = TRUE)
for(b in 1:B)
    lines(res[[b]], col = adjustcolor(col[1], alpha.f = 10/B)) # bootstrap geom. expectiles
lines(gEX.a1, col = col[1]) # "true" geometric expectiles
points(rbind(colMeans(X)), pch = 19, cex = 1.2) # filled dot

## ------------------------------------------------------------------------
## Determine alphas
u <- c(1, 1) / sqrt(2) # direction
n. <- 64
mag <- tail(head(seq(-1, 1, length.out = n.), n = -1), n = -1) # magnitude
a <- matrix(mag * rep(u, each = n. - 2), ncol = 2) # alpha

## ------------------------------------------------------------------------
## Compute geometric VaRs and expectiles for the alphas
gVaR.a <- matrix(vapply(gVaR(X, level = a), `[[`, numeric(2), "par"),
                 ncol = 2, byrow = TRUE)
gEX.a  <- matrix(vapply(gEX (X, level = a), `[[`, numeric(2), "par"),
                 ncol = 2, byrow = TRUE)

## ---- fig.align = "center", fig.width = 6, fig.height = 6----------------
## Plot of margins of geometric VaRs and expectiles
## Note: bold() does not respect Greek letters
yran <- range(gVaR.a, gEX.a) # determine plotting range
xlab <- expression("r for"~bold(alpha)~"= r"*bold(u)) # x-axis label
plot(mag, gVaR.a[,1], type = "l", lty = 2, ylim = yran, lwd = 2, col = col[1],
     xlab = xlab, ylab = "Marginal risk measure") # 1st-margin geometric VaRs
lines(mag, gVaR.a[,2], lty = 2, lwd = 2, col = col[2]) # 2nd-margin geometric VaRs
lines(mag, gEX.a[,1], lwd = 2, col = col[1]) # 1st-margin geometric expectiles
lines(mag, gEX.a[,2], lwd = 2, col = col[2]) # 2nd-margin geometric expectiles
legend("topleft", bty = "n", lty = c(2, 2, 1, 1), lwd = 2, col = col[c(1, 2, 1, 2)],
       legend = c(expression("1st component of"~VaR[bold(alpha)](bold(X))),
                  expression("2nd component of"~VaR[bold(alpha)](bold(X))),
                  expression("1st component of"~e[bold(alpha)](bold(X))),
                  expression("2nd component of"~e[bold(alpha)](bold(X)))))

