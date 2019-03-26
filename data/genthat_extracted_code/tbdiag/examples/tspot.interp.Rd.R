library(tbdiag)


### Name: tspot.interp
### Title: Interpret the results of the Oxford Immunotec TSPOT.TB assay for
###   latent tuberculosis infection.
### Aliases: tspot.interp

### ** Examples

# Calculate results
test.tspots$result.check <- with(test.tspots,
                                 tspot.interp(nil = nil,
                                              panel.a = panel.a,
                                              panel.b = panel.b,
                                              mito = mito))

# Compare lab and calculated results
with(test.tspots, table(lab.result, result.check, exclude = NULL))

# Compare different levels of verbosity
test.tspots$verbose.check <- with(test.tspots,
                                  tspot.interp(nil = nil,
                                               panel.a = panel.a,
                                               panel.b = panel.b,
                                               mito = mito,
                                               verbosity = "verbose"))

test.tspots$onechar.check <- with(test.tspots,
                                  tspot.interp(nil = nil,
                                               panel.a = panel.a,
                                               panel.b = panel.b,
                                               mito = mito,
                                               verbosity = "onechar"))

unique(test.tspots[ , c("lab.result", "result.check",
                      "verbose.check", "onechar.check")])



