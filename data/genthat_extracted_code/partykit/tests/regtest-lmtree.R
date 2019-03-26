library("partykit")

set.seed(29)
n <- 1000
x <- runif(n)
z <- runif(n)
y <- rnorm(n, mean = x * c(-1, 1)[(z > 0.7) + 1], sd = 3)
z_noise <- factor(sample(1:3, size = n, replace = TRUE))
d <- data.frame(y = y, x = x, z = z, z_noise = z_noise)


fmla <- as.formula("y ~ x | z + z_noise")

(m_mob <- mob(formula = fmla, data = d, fit = partykit:::lmfit))
(m_lm2 <- lmtree(formula = fmla, data = d))


mods <- nodeapply(m_lm2, ids = nodeids(m_lm2, terminal = TRUE), function(x) x$info$object)
sum(sapply(mods, function(x) sum(x$residuals^2)))

