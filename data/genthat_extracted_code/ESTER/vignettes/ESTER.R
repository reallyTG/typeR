## ----echo = TRUE, eval = TRUE, message = FALSE, fig.align = "center", fig.height = 5, fig.width = 5----
library(ESTER)

sim <-
    simER(cohensd = 0.8, nmin = 20, nmax = 100, boundary = 10,
        nsims = 100, ic = bic, cores = 2, verbose = FALSE)

plot(sim, log = TRUE, hist = TRUE)

## ----echo = TRUE, eval = TRUE--------------------------------------------
data(mtcars)

mod1 <- lm(mpg ~ cyl, mtcars)
mod2 <- lm(mpg ~ cyl + disp, mtcars)
mod3 <- lm(mpg ~ cyl * disp, mtcars)
mods <- list(m1 = mod1, m2 = mod2, m3 = mod3)

ictab(mods, bic)

## ----echo = TRUE, eval = TRUE, fig.align = "center", fig.height = 5, fig.width = 5, warning = FALSE, results = "hide"----
data(mtcars)

mod1 <- lm(mpg ~ cyl, mtcars)
mod2 <- lm(mpg ~ cyl + disp, mtcars)

plot(seqER(ic = bic, mod1, mod2, nmin = 10) )

## ----echo = TRUE, eval = TRUE, fig.align = "center", fig.height = 5, fig.width = 5, warning = FALSE, results = "hide"----
plot(seqER(ic = bic, mod1, mod2, nmin = 10, nsims = 10) )

## ----echo = TRUE, eval = TRUE, fig.align = "center", fig.height = 5, fig.width = 5, warning = FALSE, results = "hide"----
library(lme4)
data(sleepstudy)

mod1 <- lmer(Reaction ~ Days + (1|Subject), sleepstudy)
mod2 <- lmer(Reaction ~ Days + I(Days^2) + (1|Subject), sleepstudy)

plot(seqER(ic = bic, mod1, mod2, nmin = 10, id = "Subject", nsims = 10) )

