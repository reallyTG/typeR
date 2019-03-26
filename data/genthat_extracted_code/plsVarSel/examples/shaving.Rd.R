library(plsVarSel)


### Name: shaving
### Title: Repeated shaving of variables
### Aliases: shaving plot.shaved print.shaved

### ** Examples

data(mayonnaise, package = "pls")
sh <- shaving(mayonnaise$design[,1], pls::msc(mayonnaise$NIR), type = "interleaved")
pars <- par(mfrow = c(2,1), mar = c(4,4,1,1))
plot(sh)
plot(sh, what = "spectra")
par(pars)
print(sh)




