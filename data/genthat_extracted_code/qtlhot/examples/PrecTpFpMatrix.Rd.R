library(qtlhot)


### Name: PrecTpFpMatrix
### Title: Determine false positive and true positive rates for known
###   targets.
### Aliases: FitAllTests JoinTestOutputs PrecTpFpMatrix CitTests
###   p.adjust.np
### Keywords: utilities

### ** Examples

example(GetCandReg)
## Suppose y1 is causal with targets y2 and y3.
targets <- list(y1 = c("y2","y3"))

tests <- list()
for(k in seq(names(comap.targets))) {
  tests[[k]] <- FitAllTests(CMSTCross, pheno1 = names(comap.targets)[k],
                      pheno2 = comap.targets[[k]],
                      Q.chr = cand.reg[k, 4],
                      Q.pos = cand.reg[k, 5])
}
names(tests) <- names(comap.targets)
tests <- JoinTestOutputs(comap.targets, tests)

PrecTpFpMatrix(alpha = seq(0.01, 0.10, by = 0.01),
  val.targets = targets, all.orfs = CMSThigh$names, tests = tests,
  cand.reg = cand.reg, cis.cand.reg = cis.cand.reg)



