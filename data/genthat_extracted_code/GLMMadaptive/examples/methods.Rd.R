library(GLMMadaptive)


### Name: MixMod Methods
### Title: Various Methods for Standard Generics
### Aliases: methods.MixMod coef coef.MixMod fixef fixef.MixMod ranef
###   ranef.MixMod confint confint.MixMod anova anova.MixMod fitted
###   fitted.MixMod residuals residuals.MixMod predict predict.MixMod
###   simulate simulate.MixMod terms terms.MixMod model.matrix
###   model.matrix.MixMod model.frame model.frame.MixMod

### ** Examples

## No test: 
# simulate some data
set.seed(123L)
n <- 500
K <- 15
t.max <- 25

betas <- c(-2.13, -0.25, 0.24, -0.05)
D <- matrix(0, 2, 2)
D[1:2, 1:2] <- c(0.48, -0.08, -0.08, 0.18)

times <- c(replicate(n, c(0, sort(runif(K-1, 0, t.max)))))
group <- sample(rep(0:1, each = n/2))
DF <- data.frame(year = times, group = factor(rep(group, each = K)))
X <- model.matrix(~ group * year, data = DF)
Z <- model.matrix(~ year, data = DF)

b <- cbind(rnorm(n, sd = sqrt(D[1, 1])), rnorm(n, sd = sqrt(D[2, 2])))
id <- rep(1:n, each = K)
eta.y <- as.vector(X %*% betas + rowSums(Z * b[id, ]))
DF$y <- rbinom(n * K, 1, plogis(eta.y))
DF$id <- factor(id)

################################################

fm1 <- mixed_model(fixed = y ~ year + group, random = ~ year | id, data = DF,
                   family = binomial())

head(coef(fm1))
fixef(fm1)
head(ranef(fm1))


confint(fm1)
confint(fm1, "var-cov")

head(fitted(fm1, "subject_specific"))
head(residuals(fm1, "marginal"))

fm2 <- mixed_model(fixed = y ~ year * group, random = ~ year | id, data = DF,
                   family = binomial())

# likelihood ratio test between fm1 and fm2
anova(fm1, fm2)

# the same but with a Wald test
anova(fm2, L = rbind(c(0, 0, 0, 1)))
## End(No test)



