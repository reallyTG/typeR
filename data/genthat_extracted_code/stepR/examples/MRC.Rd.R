library(stepR)


### Name: MRC
### Title: Compute Multiresolution Criterion
### Aliases: MRC MRCoeff MRC.pvalue MRC.quant MRC.simul chi chi.FFT MRC.FFT
###   MRCoeff.FFT kMRC.pvalue kMRC.quant kMRC.simul
### Keywords: nonparametric

### ** Examples

set.seed(100)
all.equal(MRC.simul(100, r = 100),
          sort(monteCarloSimulation(n = 100, r = 100, output = "maximum",
                                    penalty = "none", intervalSystem = "dyaLen")),
          check.attributes = FALSE)

# simulate signal of 100 data points
set.seed(100)
f <- rep(c(0, 2, 0), c(60, 10, 30))
# add gaussian noise
x <- f + rnorm(100)
# compute multiresolution criterion
m <- MRC(x)
# compute Monte-Carlo p-value based on 100 simulations
MRC.pvalue(m["max"], length(x), 100)
# compute multiresolution coefficients
M <- MRCoeff(x)
# plot multiresolution coefficients, colours show p-values below 5% in 1% steps
op <- par(mar = c(5, 4, 2, 4) + 0.1)
image(1:length(x), seq(min(x), max(x), length = ncol(M)), apply(M[,ncol(M):1], 1:2,
  MRC.pvalue, n = length(x), r = 100), breaks = (0:5) / 100,
  col = rgb(1, seq(0, 1, length = 5), 0, 0.75),
  xlab = "location / left end of interval", ylab ="measurement",
  main = "Multiresolution Coefficients",
  sub = paste("MRC p-value =", signif(MRC.pvalue(m["max"], length(x), 100), 3)))
axis(4, min(x) + diff(range(x)) * ( pretty(1:ncol(M) - 1) ) / dim(M)[2],
  2^pretty(1:ncol(M) - 1))
mtext("interval lengths", 4, 3)
# plot signal and its mean
points(x)
lines(f, lty = 2)
abline(h = mean(x))
par(op)



