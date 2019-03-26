library(DiscreteFDR)


### Name: kernel.DBR
### Title: Kernel functions for DBR
### Aliases: kernel.DBR kernel.DBR.fast kernel.DBR.crit

### ** Examples

X1 <- c(4, 2, 2, 14, 6, 9, 4, 0, 1)
X2 <- c(0, 0, 1, 3, 2, 1, 2, 2, 2)
N1 <- rep(148, 9)
N2 <- rep(132, 9)
Y1 <- N1-X1
Y2 <- N2-X2
df <- data.frame(X1,Y1,X2,Y2)
df
#Construction of the p-values and their support
df.formatted <- fisher.pvalues.support(counts = df, input = "noassoc")
raw.pvalues <- df.formatted$raw
pCDFlist <- df.formatted$support

m <- length(raw.pvalues)
alpha <- 0.05
lambda <- 0.05

#Compute the step functions from the supports
stepf <- build.stepfuns(pCDFlist)

#If not searching for critical constants, we use only the observed p-values
sorted.pvals <- sort(raw.pvalues)
y <- kernel.DBR.fast(stepf, sorted.pvals, lambda)

#If searching for critical constants, we use (almost) the complete support
pv.list.all <- unique(sort(as.numeric(unlist(pCDFlist))))
# apply the shortcut drawn from Corollary 3, that is
# c.1 >= the effective critical value associated to min((1 - lambda) * alpha/m , lambda)
pv.list <- short.eff(pv.list.all, min((1 - lambda) * alpha/m , lambda))
# then re-add the observed p-values (needed to compute the adjusted p-values),
# because we may have removed some of them the shortcut
pv.list <- sort(unique(c(pv.list, sorted.pvals)))
# compute transformed support
y <- kernel.DBR.crit(stepf, pv.list, lambda, alpha, sorted.pvals)
crit.constants <- y$crit.consts
transformed.pvalues <- y$pval.transf
last.index <- y$m.lambda




