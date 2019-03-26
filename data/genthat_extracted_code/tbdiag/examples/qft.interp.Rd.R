library(tbdiag)


### Name: qft.interp
### Title: Interpret the results of the Cellestis Quantiferon Gold In-Tube
###   assay for latent tuberculosis infection.
### Aliases: qft.interp

### ** Examples

# Calculate results
test.qfts$result.check <- with(test.qfts,
                               qft.interp(nil = nil,
                                          tb = tb,
                                          mito = mito))

# Compare lab and calculated results
with(test.qfts, table(lab.result, result.check, exclude = NULL))

# Compare different levels of verbosity
test.qfts$verbose.check <- with(test.qfts,
                                qft.interp(nil = nil,
                                           tb = tb,
                                           mito = mito,
                                           verbosity = "verbose"))

test.qfts$onechar.check <- with(test.qfts,
                                qft.interp(nil = nil,
                                           tb = tb,
                                           mito = mito,
                                           verbosity = "onechar"))

unique(test.qfts[ , c("lab.result", "result.check",
                      "verbose.check", "onechar.check")])



