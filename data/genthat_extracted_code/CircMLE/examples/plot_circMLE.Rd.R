library(CircMLE)


### Name: plot_circMLE
### Title: plot_circMLE
### Aliases: plot_circMLE
### Keywords: plot_circMLE

### ** Examples

testdata = circular::rvonmises(100, mu = circular::circular(pi), kappa = 3)
out = circ_mle(testdata)
plot_circMLE(testdata, out)
plot_circMLE(testdata, out, model = "M4A")



