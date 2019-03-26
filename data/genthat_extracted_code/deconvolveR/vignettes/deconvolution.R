## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(
    message = FALSE,
    warning = FALSE,
    error = FALSE,
    tidy = FALSE,
    cache = FALSE
)

## ------------------------------------------------------------------------
set.seed(238923) ## for reproducibility
N <- 1000
Theta <- rchisq(N,  df = 10)

## ------------------------------------------------------------------------
nSIM <- 1000
data <- sapply(seq_len(nSIM), function(x) rpois(n = N, lambda = Theta))

## ------------------------------------------------------------------------
library(deconvolveR)
tau <- seq(1, 32)
results <- apply(data, 2,
                 function(x) deconv(tau = tau, X = x, ignoreZero = FALSE,
                                    c0 = 1))

## ------------------------------------------------------------------------
g <- sapply(results, function(x) x$stats[, "g"])
mean <- apply(g, 1, mean)
SE.g <- sapply(results, function(x) x$stats[, "SE.g"])
sd <- apply(SE.g, 1, mean)
Bias.g <- sapply(results, function(x) x$stats[, "Bias.g"])
bias <- apply(Bias.g, 1, mean)
gTheta <- pchisq(tau, df = 10) - pchisq(c(0, tau[-length(tau)]), df = 10)
gTheta <- gTheta / sum(gTheta)
simData <- data.frame(theta = tau, gTheta = gTheta,
                      Mean = mean, StdDev = sd, Bias = bias,
                      CoefVar = sd / mean)
table1 <- transform(simData,
                    gTheta = 100 * gTheta,
                    Mean = 100 * Mean,
                    StdDev = 100 * StdDev,
                    Bias = 100 * Bias)

## ------------------------------------------------------------------------
knitr::kable(table1[c(5, 10, 15, 20, 25), ], row.names=FALSE)

## ------------------------------------------------------------------------
library(ggplot2)
library(cowplot)
theme_set(theme_get() +
          theme(panel.grid.major = element_line(colour = "gray90",
                                                size = 0.2),
                panel.grid.minor = element_line(colour = "gray98",
                                                size = 0.5)))
p1 <- ggplot(data = as.data.frame(results[[1]]$stats)) +
    geom_line(mapping = aes(x = theta, y = SE.g), color = "black", linetype = "solid") +
    geom_line(mapping = aes(x = simData$theta, y = simData$StdDev), color = "red", linetype = "dashed") +
    labs(x = expression(theta), y = "Std. Dev")

p2 <- ggplot(data = as.data.frame(results[[1]]$stats)) +
    geom_line(mapping = aes(x = theta, y = Bias.g), color = "black", linetype = "solid") +
    geom_line(mapping = aes(x = simData$theta, y = simData$Bias), color = "red", linetype = "dashed") +
    labs(x = expression(theta), y = "Std. Dev")
plot_grid(plotlist = list(p1, p2), ncol = 2)

## ------------------------------------------------------------------------
data(bardWordCount)
str(bardWordCount)

## ------------------------------------------------------------------------
lambda <- seq(-4, 4.5, .025)
tau <- exp(lambda)

## ------------------------------------------------------------------------
result <- deconv(tau = tau, y = bardWordCount, n = 100, c0=2)
stats <- result$stats

## ------------------------------------------------------------------------
ggplot() +
    geom_line(mapping = aes(x = lambda, y = stats[, "g"])) +
    labs(x = expression(log(theta)), y = expression(g(theta)))

## ------------------------------------------------------------------------
print(result$R)

## ------------------------------------------------------------------------
gt <- stats[, "g"] / (1 - exp(-tau))
gt <- gt / sum(gt)

## ------------------------------------------------------------------------
d <- data.frame(lambda = lambda, g = stats[, "g"], SE.g = stats[, "SE.g"])
indices <- seq(1, length(lambda), 5)
ggplot(data = d) +
    geom_line(mapping = aes(x = lambda, y = g)) +
    geom_errorbar(data = d[indices, ],
                  mapping = aes(x = lambda, ymin = g - SE.g, ymax = g + SE.g),
                  width = .01, color = "blue") +
    labs(x = expression(log(theta)), y = expression(g(theta))) +
    ylim(0, 0.006) +
    geom_line(mapping = aes(x = lambda, y = gt), linetype = "dashed", color = "red")

## ---- fig.keep='all', fig.width=7.5, fig.height=10-----------------------
gPost <- sapply(seq_len(100), function(i) local({gt <- gt * result$P[i, ]; gt / sum(gt)}))
plots <- lapply(c(1, 2, 4, 8), function(i) {
    ggplot() +
        geom_line(mapping = aes(x = tau, y = gPost[, i])) +
        labs(x = expression(theta), y = expression(g(theta)),
             title = sprintf("x = %d", i))
})
plots <- Map(f = function(p, xlim) p + xlim(0, xlim), plots, list(6, 8, 14, 20))
plot_grid(plotlist = plots, ncol = 2)

## ------------------------------------------------------------------------
set.seed(1783)
B <- 200
fHat <- as.numeric(result$P %*% d$g)
fHat <- fHat / sum(fHat)
yStar <- rmultinom(n = B, size = sum(bardWordCount), prob = fHat)
gBoot <- apply(yStar, 2,
               function(y) deconv(tau = tau, y = y, n = 100, c0 = 2)$stats[, "g"])
seG <- apply(gBoot, 1, sd)
ggplot(data = d) +
    geom_line(mapping = aes(x = lambda, y = SE.g,
                            color = "Theoretical", linetype = "Theoretical")) +
    geom_line(mapping = aes(x = lambda, y = seG,
                            color = "Bootstrap", linetype = "Bootstrap")) +
    scale_color_manual(name = "Legend",
                       values = c("Bootstrap" = "black", "Theoretical" = "red")) +
    scale_linetype_manual(name = "Legend",
                          values = c("Bootstrap" = "solid", "Theoretical" = "dashed")) +
    theme(legend.title = element_blank()) +
    labs(x = expression(log(theta)), y = expression(sigma(hat(g))))


## ------------------------------------------------------------------------
gHat <- stats[, "g"]
Rfn <- function(t) {
    sum( gHat * (1 - exp(-tau * t)) / (exp(tau) - 1) )
}
r <- sapply(0:10, Rfn)
ggplot() +
    geom_line(mapping = aes(x = 0:10, y = r)) +
    labs(x = "time multiple t", y = expression(R(t)))

## ------------------------------------------------------------------------
print(uniroot(f = function(x) Rfn(x) - 1, interval = c(2, 4))$root)

## ------------------------------------------------------------------------
set.seed(129023)
N <- 10000
pi0 <- .90
data <- local({
    nullCase <- (runif(N) <= pi0)
    muAndZ <- t(sapply(nullCase, function(isNull) {
        if (isNull) {
            mu <- 0
            c(mu, rnorm(1))
        } else {
            mu <- rnorm(1, mean = -3)
            c(mu, rnorm(1, mean = mu))
        }
    }))
    data.frame(nullCase = nullCase, mu = muAndZ[, 1], z = muAndZ[, 2])
})

## ------------------------------------------------------------------------
p1 <- ggplot(mapping = aes(x = data$z)) +
    geom_histogram(mapping = aes(y  = ..count.. / sum(..count..) ),
                   color = "brown", bins = 60, alpha = 0.5) +
    labs(x = "z", y = "Density")
p2 <- ggplot(mapping = aes(x = data$mu)) +
    geom_histogram(mapping = aes(y  = ..count.. / sum(..count..) ),
                   color = "brown", bins = 60, alpha = 0.5) +
    labs(x = expression(theta), y = "Density")
plot_grid(plotlist = list(p1, p2), ncol = 2)

## ------------------------------------------------------------------------
tau <- seq(from = -6, to = 3, by = 0.25)
atomIndex <- which(tau == 0)
result <- deconv(tau = tau, X = data$z, deltaAt = 0, family = "Normal", pDegree = 5)

## ------------------------------------------------------------------------
knitr::kable(result$stats)

## ------------------------------------------------------------------------
gData <- as.data.frame(result$stats[-atomIndex, c("theta", "g")])
gData$g <- gData$g / sum(gData$g)
ggplot(data = gData) +
    geom_line(mapping = aes(x = theta, y = g)) +
    geom_line(mapping = aes(x = theta, y = dnorm(theta, mean = -3)),
                            color = "red") +
    labs(x = expression(theta), y = expression(g(theta)))

## ------------------------------------------------------------------------
p <- pnorm(data$z)
orderP <- order(p)
p <- p[orderP]

## ------------------------------------------------------------------------
## FCR
q <- 0.05
R <- max(which(p <= seq_len(N) * q / N))
discIdx <- orderP[1:R]
disc <- data[discIdx, ]
cat("BY_q procedure discoveries", R, "cases,", sum(disc$nullCase),
    "actual nulls among them.\n")

## ------------------------------------------------------------------------
alphaR <- 1 - R * q / N
zAlpha <- qnorm(alphaR, lower.tail = FALSE)
zMarker <- max(disc$z)
xlim <- c(-7.6, 0.0)
ylim <- c(-10, 0.0)
BY.lo <- c(xlim[1] - zAlpha, xlim[2] - zAlpha)
BY.up <- c(xlim[1] + zAlpha, xlim[2] + zAlpha)
Bayes.lo <- c(0.5 * (xlim[1] - 3) - 1.96 / sqrt(2), 0.5 * (xlim[2] - 3) - 1.96 / sqrt(2))
Bayes.up <- c(0.5 * (xlim[1] - 3) + 1.96 / sqrt(2), 0.5 * (xlim[2] - 3) + 1.96 / sqrt(2))

## ------------------------------------------------------------------------
d <- data[order(data$mu), ]
muVals <- unique(d$mu)
s <- as.data.frame(result$stats)
indices <- findInterval(muVals, s$theta) + 1
gMu <- s$g[indices]
st <- seq(min(data$z), -2.0, length.out = 40)
gMuPhi <- sapply(st, function(z) gMu * dnorm(z - muVals))
g2 <- apply(gMuPhi, 2, function(x) cumsum(x)/sum(x))
pct <- apply(g2, 2, function(dist) approx(y = muVals, x = dist, xout = c(0.025, 0.975)))
qVals <- sapply(pct, function(item) item$y)

## ------------------------------------------------------------------------
ggplot() +
    geom_line(mapping = aes(x = xlim, y = BY.lo), color = "blue") +
    geom_line(mapping = aes(x = xlim, y = BY.up), color = "blue") +
    geom_line(mapping = aes(x = xlim, y = Bayes.lo), color = "magenta",
              linetype = "dashed") +
    geom_line(mapping = aes(x = xlim, y = Bayes.up), color = "magenta",
              linetype = "dashed") +
    geom_point(mapping = aes(x = disc$z, y = disc$mu), color = "red") +
    geom_point(mapping = aes(x = disc$z[disc$nullCase], y = disc$mu[disc$nullCase]),
                             color = "orange") +
    geom_line(mapping = aes(x = rep(zMarker, 2), y = c(-10, 1))) +
    geom_line(mapping = aes(x = st, y = qVals[1, ]), color = "brown") +
    geom_line(mapping = aes(x = st, y = qVals[2, ]), color = "brown") +
    labs(x = "Observed z", y = expression(mu)) +
    annotate("text", x = -1, y = -4.25, label = "BY.lo") +
    annotate("text", x = -1, y = 1.25, label = "BY.up") +
    annotate("text", x = -7.5, y = -6.1, label = "Bayes.lo") +
    annotate("text", x = -7.5, y = -3.4, label = "Bayes.up") +
    annotate("text", x = -2.0, y = -1.75, label = "EB.lo") +
    annotate("text", x = -2.0, y = -3.9, label = "EB.up") +
    annotate("text", x = zMarker, y = 1.25, label = as.character(round(zMarker, 2)))

## ------------------------------------------------------------------------
p1 <- ggplot(mapping = aes(x = disjointTheta)) +
    geom_histogram(mapping = aes(y  = ..count.. / sum(..count..) ),
                   color = "brown", bins = 60, alpha = 0.5) +
    labs(x = expression(theta), y = "Density")
set.seed (2332)
z <- rnorm(n = length(disjointTheta), mean = disjointTheta)
p2 <- ggplot(mapping = aes(x = z)) +
    geom_histogram(mapping = aes(y  = ..count.. / sum(..count..) ),
                   color = "brown", bins = 60, alpha = 0.5) +
    labs(x = "z", y = "Density")
plot_grid(plotlist = list(p1, p2), ncol = 2)

## ---- fig.keep='all', fig.width=7.5, fig.height=10-----------------------
tau <- seq(from = -4, to = 6, by = 0.2)
plots1 <- lapply(2:7,
                 function(p) {
                     result <- deconv(tau = tau, X = z, family = "Normal", pDegree = p)
                     g <- result$stats[, "g"]
                     ggplot(mapping = aes(x = z)) +
                         geom_histogram(mapping = aes(y = ..count.. / sum(..count..)),
                                        color = "brown", bins = 60, alpha = 0.2) +
                         geom_line(mapping = aes(x = tau, y = g), color = "blue") +
                         labs(x = "z", y = "Density", title = sprintf("DF = %d", p))
                 })
plots2 <- lapply(2:7,
                 function(p) {
                     result <- deconv(tau = tau, X = z, family = "Normal", pDegree = p)
                     g <- result$stats[, "g"]
                     ggplot(mapping = aes(x = disjointTheta)) +
                         geom_histogram(mapping = aes(y = ..count.. / sum(..count..)),
                                        color = "brown", bins = 60, alpha = 0.2) +
                         geom_line(mapping = aes(x = tau, y = g), color = "blue") +
                         labs(x = expression(theta), y = "Density",
                              title = sprintf("DF = %d", p))
                })
plots <- mapply(function(x, y) list(x, y), plots1, plots2)
plot_grid(plotlist = plots, ncol=2)

## ---- fig.keep='all', fig.width=7.5, fig.height=10-----------------------
plots1 <- lapply(c(0.5, 1, 2, 4, 16, 32),
                 function(c0) {
                     result <- deconv(tau = tau, X = z, family = "Normal", pDegree = 6,
                                      c0 = c0)
                     g <- result$stats[, "g"]
                     ggplot(mapping = aes(x = z)) +
                         geom_histogram(mapping = aes(y = ..count.. / sum(..count..)),
                                        color = "brown", bins = 60, alpha = 0.2) +
                         geom_line(mapping = aes(x = tau, y = g), color = "blue") +
                         labs(x = "z", y = "Density", title = sprintf("C0 = %.1f", c0))
                 })
plots2 <- lapply(c(0.5, 1, 2, 4, 16, 32),
                 function(c0) {
                     result <- deconv(tau = tau, X = z, family = "Normal", pDegree = 6,
                                      c0 = c0)
                     g <- result$stats[, "g"]
                     ggplot(mapping = aes(x = disjointTheta)) +
                         geom_histogram(mapping = aes(y = ..count.. / sum(..count..)),
                                        color = "brown", bins = 60, alpha = 0.2) +
                         geom_line(mapping = aes(x = tau, y = g), color = "blue") +
                         labs(x = expression(theta), y = "Density",
                              title = sprintf("C0 = %.1f", c0))
                })
plots <- mapply(function(x, y) list(x, y), plots1, plots2)
plot_grid(plotlist = plots, ncol = 2)

## ------------------------------------------------------------------------
tau <- seq(from = 0.01, to = 0.99, by = 0.01)
result <- deconv(tau = tau, X = surg, family = "Binomial", c0 = 1)
d <- data.frame(result$stats)
indices <- seq(5, 99, 5)
errorX <- tau[indices]
ggplot() +
    geom_line(data = d, mapping = aes(x = tau, y = g)) +
    geom_errorbar(data = d[indices, ],
                  mapping = aes(x = theta, ymin = g - SE.g, ymax = g + SE.g),
                  width = .01, color = "blue") +
    labs(x = expression(theta), y = expression(paste(g(theta), " +/- SE")))

## ------------------------------------------------------------------------
knitr::kable(d[indices, ], row.names = FALSE)

## ------------------------------------------------------------------------
set.seed(32776)
B <- 1000
gHat <- d$g
N <- nrow(surg)

genBootSample <- function() {
    thetaStar <- sample(tau, size = N, replace = TRUE, prob = gHat)
    sStar <- sapply(seq_len(N),
                    function(i)
                        rbinom(n = 1 , size = surg$n[i], prob = thetaStar[i]))
    data.frame(n = surg$n, s = sStar)
}

bootResults <- lapply(seq_len(B),
                      function(k) {
                          surgBoot <- genBootSample()
                          mat <- deconv(tau = tau, X = surgBoot, family = "Binomial",
                                        c0 = 1)$stats
                          mat[, c("g", "Bias.g")]
                      })

gBoot <- sapply(bootResults, function(x) x[, 1])
BiasBoot <- sapply(bootResults, function(x) x[, 2])

indices <- c(seq(1, 99, 11), 99)

table2 <- data.frame(theta = tau,
                     gTheta = round(gHat * 100, 3),
                     sdFormula = round(d$SE.g * 100, 3),
                     sdSimul = round(apply(gBoot, 1, sd) * 100, 3),
                     BiasFormula = round(d$Bias.g * 100, 3),
                     BiasSimul = round(apply(BiasBoot, 1, mean) * 100, 3))[ indices, ]


## ------------------------------------------------------------------------
knitr::kable(table2, row.names = FALSE)

