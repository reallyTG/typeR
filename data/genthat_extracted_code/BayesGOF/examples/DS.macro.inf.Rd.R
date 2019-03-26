library(BayesGOF)


### Name: DS.macro.inf
### Title: Execute MacroInference (mean or mode) on a DS object
### Aliases: DS.macro.inf DS.macro.inf.pge DS.macro.inf.pgu
###   DS.macro.inf.bbu DS.macro.inf.nnu Local.Mode plot.DS_GF_macro_mean
###   plot.DS_GF_macro_mode print.DS_GF_macro_mean print.DS_GF_macro_mode
###   DS.GF.macro.obj
### Keywords: DS Main Functions

### ** Examples

## Not run: 
##D ### MacroInference: Mode
##D data(rat)
##D rat.start <- gMLE.bb(rat$y, rat$n)$estimate
##D rat.ds <- DS.prior(rat, max.m = 4, rat.start. family = "Binomial")
##D rat.ds.macro <- DS.macro.inf(rat.ds, num.modes = 2, method = "mode", iters = 5)
##D rat.ds.macro
##D plot(rat.ds.macro)
##D ### MacroInference: Mean
##D data(ulcer)
##D ulcer.start <- gMLE.nn(ulcer$y, ulcer$se)$estimate
##D ulcer.ds <- DS.prior(ulcer, max.m = 4, ulcer.start)
##D ulcer.ds.macro <- DS.macro.inf(ulcer.ds, num.modes = 1, method = "mean", iters = 5)
##D ulcer.ds.macro
##D plot(ulcer.ds.macro)
## End(Not run)



