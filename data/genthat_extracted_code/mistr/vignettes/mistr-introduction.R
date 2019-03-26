## ----message=FALSE-------------------------------------------------------
library(mistr)

## ----fig.height= 5-------------------------------------------------------
op <- par(mfrow = c(2, 1))

plot(density(stocks$SAP), xlim = c(-0.07, 0.07), 
     main = "Density of SAP log-returns (black) 
     and normal distribution (red)")

x <- seq(-0.07, 0.07, 0.001)
lines(x, dnorm(x, mean(stocks$SAP), sd(stocks$SAP)),
      col = "red")

qqnorm(stocks$SAP)
qqline(stocks$SAP)

par(op)

## ------------------------------------------------------------------------
N <- normdist(mean = 1, sd = 3)
N

## ------------------------------------------------------------------------
d(N, c(1, 2, 3))
p(N, c(1, 2, 3))
q(N, c(0.1, 0.2, 0.3))
r(N, 3)

## ------------------------------------------------------------------------
B <- binomdist(size = 12, prob = 0.3)
plim(B, c(-3, 0, 3, 12))

## ------------------------------------------------------------------------
qlim(B, plim(B, c(0, 3, 7, 12)))

## ------------------------------------------------------------------------
E <- expdist(2)

E * 2

E^2

## ------------------------------------------------------------------------
E2 <- E * -2
E3 <- E2 * 5
E3

## ------------------------------------------------------------------------
Norm_trafo <- (N - 1)^(1/3)
Norm_trafo

## ------------------------------------------------------------------------
Binom_trafo <- -3 * log(B + 4)

q(Binom_trafo, c(0.05, 0.5, 0.95))
plim(Binom_trafo, c(-6, -5, 0))
sudo_support(Binom_trafo)

## ----fig.height=1.7------------------------------------------------------
par(mai = c(0.3, 0.3, 0.2, 0.2))
plot(Norm_trafo, xlim1 = c(-2.5, 2.5), ylab1 = "")

## ----fig.height=1.6,fig.width=3.4----------------------------------------
library(ggplot2)
autoplot(Norm_trafo, xlim1 = c(-2.5, 2.5))

## ----fig.height=1.6,fig.width=3.4----------------------------------------
QQplotgg(Norm_trafo, r(Norm_trafo, 1000), 
         conf = 0.99, ylab = NULL, xlab = NULL)

## ------------------------------------------------------------------------
mixdist(c("norm", "unif"), list(c(2, 2), c(1, 5)),
                            weights = c(0.5, 0.5))

## ------------------------------------------------------------------------
M <- mixdist(Norm_trafo, Binom_trafo, expdist(0.5),
                           weights = c(.4, .2, .4))

## ----fig.height=1.4,fig.width=3.4----------------------------------------
DM <- mixdist(3 * binomdist(12, 0.4),
          -2*poisdist(2) + 12, weights=c(0.5, 0.5))
y <- c(0.05, 0.4, p(-DM, c(-5, -10, -15)), 0.95)
x <- q(-DM, y)
autoplot(-DM, which = "cdf", only_mix = TRUE, 
                          xlim1 = c(-37, 0)) +
   annotate("point", x, y, col = "white")

## ------------------------------------------------------------------------
system.time(r(M, 1e6))

## ----fig.height=1.6,fig.width=3.4----------------------------------------
sudo_support(M)

## ------------------------------------------------------------------------
M_trans <- -2 * (M)^(1/3)
r(M_trans, 4)

## ----eval=FALSE----------------------------------------------------------
#  autoplot(M_trans)

## ----echo=FALSE---------------------------------
options(width = 50)

## -----------------------------------------------
C <- compdist(-paretodist(1, 1), normdist(0, 2),
              geomdist(0.3) + 2,
              weights = c(0.15, 0.7, 0.15),
              breakpoints = c(-3, 3),
              break.spec = c("L", "R"))
C

## -----------------------------------------------
C2 <- compdist(-expdist(2), poisdist(),
               expdist(2),
               weights = c(0.25, 0.5, 0.25),
               breakpoints = c(0, 0))
C2

## ----fig.height=1.7-----------------------------
par(mai = c(0.3, 0.3, 0.2, 0.2))
plot(C, xlim1 = c(-15, 15), ylab1 = "")

## ----fig.height=1.6,fig.width=3.4---------------
autoplot(C2, text_ylim = 0.01)

## -----------------------------------------------
C_trans <- -0.5 * (C + 7)

## -----------------------------------------------
q(C_trans, c(0.075, 0.5, 0.7, 0.9))
r(C_trans, 4)

## ----eval=FALSE---------------------------------
#  autoplot(C_trans, xlim1 = c(-10,5))

## -----------------------------------------------
C3 <- compdist(M_trans - 3, 
               C_trans, weights = c(0.5, 0.5),
               breakpoints = -4.5)
C3_trans <- -2 * C3 + 2

## -----------------------------------------------
plim(C3_trans, c(6, 10, 12))

qlim(C3_trans, c(0.3, 0.5, 0.7))

## ----fig.height=1.6,fig.width=3.4---------------
autoplot(C3_trans, xlim1 = c(0,20), text_ylim = 0.01,
                                       grey = TRUE)

## ----eval=FALSE---------------------------------
#  autoplot(mixdist( C3_trans, C2 + 5,
#            weights = c(0.7, 0.3)),
#                  xlim1 = c(0, 15))

## ----echo=FALSE---------------------------------
print.comp_fit <- function(x, digits = 6, ...) {
    cat("Fitted composite", x$spec$name, "\ndistribution: \n\n")
    cat("Breakpoints:", round(x$params$breakpoints, digits), "\n")
    cat("Weights:", round(x$params$weights, digits), "\n\n")
    cat("Parameters: \n")
    print(round(x$params$coef, digits))
    cat("\nLog-likelihood: ", x$spec$lik, ",\nAverage log-likelihood: ", round(x$spec$lik/length(x$data), 4), "\n\n", sep = "")
}

## -----------------------------------------------
PNP_model <- PNP_fit(stocks$SAP)

PNP_model

## ----fig.width=3.5, fig.height=3----------------
plot(PNP_model, ylab1 = "", ylab2 = "")

## ----echo=FALSE---------------------------------
print.comp_fit <- function(x, digits = 6, ...) {
    cat("Fitted composite", x$spec$name, "distribution: \n\n")
    cat("Breakpoints:", round(x$params$breakpoints, digits), "\n")
    cat("Weights:", round(x$params$weights, digits), "\n\n")
    cat("Parameters: \n")
    print(round(x$params$coef, digits))
    cat("\nLog-likelihood: ", x$spec$lik, ",\nAverage log-likelihood: ", round(x$spec$lik/length(x$data), 4), "\n\n", sep = "")
}


## -----------------------------------------------
GNG_model <- GNG_fit(stocks$SAP)

GNG_model

## ---- eval=FALSE--------------------------------
#  autoplot(GNG_model)

## -----------------------------------------------
risk(GNG_model, c(0.02, 0.05, 0.07, 0.1, 0.2, 0.3))

