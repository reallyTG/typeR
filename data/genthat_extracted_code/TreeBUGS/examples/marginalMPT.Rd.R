library(TreeBUGS)


### Name: marginalMPT
### Title: Marginal Likelihood for Simple MPT
### Aliases: marginalMPT

### ** Examples

# 2-High-Threshold Model
eqn <- "## 2HTM ##
   Target  Hit  d
   Target  Hit  (1-d)*g
   Target  Miss (1-d)*(1-g)
   Lure    FA   (1-d)*g
   Lure    CR   (1-d)*(1-g)
   Lure    CR   d"
data <- c(Hit = 46, Miss = 14,
          FA = 14, CR = 46)

# weakly informative prior for guessing
aa <- c(d = 1, g = 2)
bb <- c(d = 1, g = 2)
curve(dbeta(x, aa["g"], bb["g"]))

# compute marginal likelihood
htm <- marginalMPT(eqn, data,
                   alpha = aa, beta = bb,
                   posterior = 200, samples = 1000)
# second model: g=.50
htm.g50 <- marginalMPT(eqn, data, list("g=.5"),
                       alpha = aa, beta = bb,
                       posterior = 200, samples = 1000)

# Bayes factor
# (per batch to get estimation error)
bf <- htm.g50$p.per.batch / htm$p.per.batch
mean(bf)                 # BF
sd(bf)/sqrt(length(bf))  # standard error of BF estimate




