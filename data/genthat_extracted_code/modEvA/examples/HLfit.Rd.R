library(modEvA)


### Name: HLfit
### Title: Hosmer-Lemeshow goodness of fit
### Aliases: HLfit

### ** Examples

# load sample models:

data(rotif.mods)


# choose a particular model to play with:

mod <- rotif.mods$models[[1]]


# try HLfit using different binning methods:

HLfit(model = mod, bin.method = "round.prob", main = "HL GOF with round.prob (n=10)")

HLfit(model = mod, bin.method = "prob.bins", main = "HL GOF with prob.bins (n=10)")

HLfit(model = mod, bin.method = "size.bins", main = "HL GOF with size.bins (min size=15)")

HLfit(model = mod, bin.method = "size.bins", min.bin.size = 30, 
main = "HL GOF with size.bins min size 30")

HLfit(model = mod, bin.method = "n.bins", main = "HL GOF with 10 bins")

HLfit(model = mod, bin.method = "n.bins", fixed.bin.size = TRUE, 
main = "HL GOF with 10 bins of fixed size")

HLfit(model = mod, bin.method = "n.bins", n.bins = 20, 
main = "HL GOF with 20 bins")

HLfit(model = mod, bin.method = "quantiles", 
main = "HL GOF with quantile bins (n=10)")

HLfit(model = mod, bin.method = "quantiles", n.bins = 20,
main = "HL GOF with quantile bins (n=20)")



