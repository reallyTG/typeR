library(DiscreteFDR)


### Name: kernel
### Title: Kernel functions for discrete.BH
### Aliases: kernel kernel.DBH.fast kernel.DBH.crit kernel.ADBH.fast
###   kernel.ADBH.crit

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

# Compute the step functions from the supports
stepf <- build.stepfuns(pCDFlist)

# We stay in a step-down context, where pv.numer = pv.denom,
# for the sake of simplicity

# If not searching for critical constants, we use only the observed p-values
sorted.pvals <- sort(raw.pvalues)
y.DBH.fast <- kernel.DBH.fast(stepf, sorted.pvals, sorted.pvals)
y.ADBH.fast <- kernel.ADBH.fast(stepf, sorted.pvals, sorted.pvals)

# If searching for critical constants, we use (almost) the complete support
pv.list.all <- sort(unique(as.numeric(unlist(pCDFlist))))
# apply the shortcut drawn from Lemma 3, that is
# c.1 >= the effective critical value associated to (alpha/m)/(1 + alpha/m)
pv.list <- short.eff(pv.list.all, alpha/(m + alpha))
# then re-add the observed p-values (needed to compute the adjusted p-values),
# because we may have removed some of them by the shortcut
pv.list <- sort(unique(c(pv.list, sorted.pvals)))
# compute transformed support
y.DBH.crit <- kernel.DBH.crit(stepf, pv.list, pv.list, alpha, sorted.pvals)
y.ADBH.crit <- kernel.ADBH.crit(stepf, pv.list, pv.list, alpha, sorted.pvals)
# critical constants
y.DBH.crit$crit.consts
y.ADBH.crit$crit.consts
# The following exist only for step-down direction
y.DBH.crit$pval.transf
y.ADBH.crit$pval.transf




