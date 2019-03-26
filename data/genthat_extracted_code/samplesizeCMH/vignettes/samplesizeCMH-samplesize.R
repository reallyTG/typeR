## ----uncorrected---------------------------------------------------------
library(samplesizeCMH)

sample_size_uncorrected <- power.cmh.test(
  p2 = c(0.75,0.70,0.65,0.60),
  theta = 3,
  power = 0.9,
  t = c(0.10,0.40,0.35,0.15),
  alternative = "greater",
  correct = FALSE
)

print(sample_size_uncorrected, detail = FALSE)

## ----corrected-----------------------------------------------------------
sample_size_corrected <- power.cmh.test(
  p2 = c(0.75,0.70,0.65,0.60),
  theta = 3,
  power = 0.9,
  t = c(0.10,0.40,0.35,0.15),
  alternative = "greater",
  correct = TRUE
)

print(sample_size_corrected, n.frac = TRUE)

## ----s-------------------------------------------------------------------
power.cmh.test(
  p2 = c(0.75,0.70,0.65,0.60),
  s = 1/3,
  theta = 3,
  power = 0.9,
  t = c(0.10,0.40,0.35,0.15),
  alternative = "greater",
  correct = TRUE
)

## ----effect-size---------------------------------------------------------
effect.size(0.75,3)

## ----prop2odds-----------------------------------------------------------
# Control
prop2odds(0.75)

# Case
prop2odds(0.9)

## ----props2theta---------------------------------------------------------
props2theta(0.90,0.75)

