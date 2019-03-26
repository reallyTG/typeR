library(NPC)


### Name: NPC
### Title: Nonparametric Combination of Dependent Hypothesis Tests
### Aliases: NPC
### Keywords: ~kwd1 ~kwd2

### ** Examples


library(NPC)
## Required for this example
library(mvtnorm)
library(car)

## COVARIANCE = CORRELATION = 0.25
cov <- 0.25
N <- 8
Tr <- c(rep(0, 4), rep(1, 4))
d1 <- 1
d2 <- 1
d3 <- 1
sd <- 1
sigma <-
    matrix(c(1, cov, cov, cov, 1, cov, cov, cov, 1), ncol = 3)
## Create error matrix
set.seed(2)
ee <- rmvnorm(N, c(0, 0, 0), sigma)
mean(c(cor(ee)[1, 2], cor(ee)[3, 2], cor(ee)[1, 3]))

Y1 <- -.5 + Tr*d1 + ee[, 1]
Y2 <- -.5 + Tr*d2 + ee[, 2]
Y3 <- -.5 + Tr*d3 + ee[, 3]
## Create data
(ex.dta <- data.frame(Tr, Y1, Y2, Y3))
(diffs <- round(colMeans(subset(ex.dta, Tr == 1, -Tr)) -
                colMeans(subset(ex.dta, Tr == 0, -Tr)), 2))
mean(diffs)
## NPC
npc.out <- NPC(data=ex.dta, tr.var="Tr", tr.label=1,
               y.vars=c("Y1", "Y2", "Y3"), n.perms=1000,
               alternative = "greater", seed=1, comb.fun="NormalCF",
               test.statistic="DiffMeans", FWE.adj=FALSE)
round(npc.out$p.value, 2) ## one-sided
##>   Y1   Y2   Y3  NPC
##> 0.25 0.05 0.07 0.08

## Compare with T-tests and MANOVA
t.test(Y1 ~ Tr, var.equal = TRUE, alternative = "less")
t.test(Y2 ~ Tr, var.equal = TRUE, alternative = "less")
t.test(Y3 ~ Tr, var.equal = TRUE, alternative = "less")
car::Anova(lm(cbind(Y1, Y2, Y3) ~ Tr)) ## two-sided



