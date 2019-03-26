library(PMCMRplus)


### Name: tamhaneT2Test
### Title: Tamhane's T2 Test
### Aliases: tamhaneT2Test tamhaneT2Test.default tamhaneT2Test.formula
### Keywords: htest

### ** Examples

set.seed(245)
mn <- rep(c(1, 2^(1:4)), each=5)
sd <- rep(1:5, each=5)
x <- mn + rnorm(25, sd = sd)
g <- factor(rep(1:5, each=5))

fit <- aov(x ~ g)
shapiro.test(residuals(fit))
bartlett.test(x ~ g) # var1 != varN
anova(fit)
summary(T2 <- tamhaneT2Test(x, g))
T2
## compare with pairwise.t.test
WT <- pairwise.t.test(x, g, pool.sd = FALSE, p.adjust.method = "none")
p.adj.sidak <- function(p, m) sapply(p, function(p) min(1, 1 - (1 - p)^m))
p.raw <- as.vector(WT$p.value)
m <- length(p.raw[!is.na(p.raw)])
PADJ <- matrix(ans <- p.adj.sidak(p.raw, m),
               nrow = 4, ncol = 4)
colnames(PADJ) <- colnames(WT$p.value)
rownames(PADJ) <- rownames(WT$p.value)
PADJ

## same without Welch's approximate solution
summary(T2b <- tamhaneT2Test(x, g, welch = FALSE))





