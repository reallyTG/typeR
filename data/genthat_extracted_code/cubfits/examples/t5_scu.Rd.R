library(cubfits)


### Name: Selection on Codon Usage
### Title: Function for Selection on Codon Usage (SCU)
### Aliases: calc_scu_values
### Keywords: tool

### ** Examples

## Not run: 
##D library(cubfits, quietly = TRUE)
##D 
##D b <- b.Init$roc
##D phi.Obs <- ex.train$phi.Obs
##D y <- ex.train$y
##D y.list <- convert.y.to.list(y)
##D mSCU <- calc_scu_values(b, y.list, phi.Obs)$mSCU
##D plot(mSCU, log10(phi.Obs), main = "Expression vs mSCU",
##D      xlab = "mSCU", ylab = "Expression (log10)")
##D 
##D ### Compare with CAI with weights seqinr::cubtab$sc.
##D library(seqinr, quietly = TRUE)
##D w <- caitab$sc
##D names(w) <- codon.low2up(rownames(caitab))
##D CAI <- calc_cai_values(y, y.list, w = w)$CAI
##D 
##D plot(mSCU, CAI, main = "CAI vs mSCU",
##D      xlab = "mSCU", ylab = "CAI")
## End(Not run)



