library(prefmod)


### Name: llbt.fit
### Title: Function to fit an LLBT
### Aliases: llbt.fit
### Keywords: models

### ** Examples

# fit basic model casewise
mfr <- llbt.design(cemspc, nitems = 6,
    objnames = c("lo", "pa", "mi", "sg", "ba", "st"),
    casewise = TRUE)
mm   <- model.matrix(~ lo+pa+mi+sg+ba + g1, data = mfr)
X    <- mm[, -1]
p    <- ncol(X)
ncat <- 3
q    <- length(levels(mfr$mu)) * length(levels(mfr$CASE))
llbt.fit(mfr$y, X, q, ncat)


# fit the (aggregated) model with one subject covariate
mfr <- llbt.design(cemspc, nitems = 6,
    objnames = c("lo", "pa", "mi", "sg", "ba", "st"),
    cov.sel = "ENG")
eng  <- mfr$ENG
eng  <- factor(eng)
mm   <- model.matrix(~ lo+pa+mi+sg+ba + g1 + (lo+pa+mi+sg+ba):eng, data = mfr)
X    <- mm[, -1]
q    <- length(levels(mfr$mu)) * length(levels(eng))
ncat <- 3
llbt.fit(mfr$y, X, q, ncat)



