## ----setup, include=FALSE, cache=FALSE-----------------------------------
require(alpaca)
require(knitr)
opts_chunk$set(size = "small", tidy = TRUE, comment = "")
knit_theme$set("print")

## ------------------------------------------------------------------------
# Generate artificial data set
n <- 200L
t <- 100L
data <- simGLM(n, t, 1805L, "logit")

# Use 'feglm()' and 'glm()'
mod.alpaca <- feglm(y ~ x1 + x2 + x3 | i + t, data, family = binomial())
mod.glm <- glm(y ~ x1 + x2 + x3 + factor(i) + factor(t) + 0, data,
               family = binomial())

# Compare estimates of structural parameters
beta.mat <- cbind(coef(mod.alpaca), coef(mod.glm)[seq(3L)])
colnames(beta.mat) <- c("feglm", "glm")
beta.mat

# Show 'summary()'
summary(mod.alpaca)

## ------------------------------------------------------------------------
# Rank deficient solution
alpha.rd <- getFEs(mod.alpaca)

# Apply estimable function. Use First level of second fixed effects category as reference
alpha <- alpha.rd[- (n + 1L)]
alpha.ref <- alpha.rd[n + 1L]
alpha <- c(alpha[seq(n)] + alpha.ref, alpha[seq(n + 1L, n + t - 1L)] - alpha.ref)

# Compare estimates of fixed effects
alpha.mat <- cbind(alpha, coef(mod.glm)[- seq(3L)])
colnames(alpha.mat) <- c("feglm", "glm")
head(alpha.mat)
tail(alpha.mat)

## ------------------------------------------------------------------------
sec.alpaca <- system.time(mod.alpaca <- feglm(y ~ x1 + x2 + x3 | i + t, data,
                                              family = binomial()))[[3L]]
sec.glm <- system.time(mod.glm <- glm(y ~ x1 + x2 + x3 + factor(i) + factor(t) + 0,
                                      data, family = binomial()))[[3L]]
c(alpaca = sec.alpaca, glm = sec.glm)

