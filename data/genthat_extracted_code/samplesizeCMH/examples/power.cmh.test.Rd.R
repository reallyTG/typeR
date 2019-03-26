library(samplesizeCMH)


### Name: power.cmh.test
### Title: Power and sample size calculation for the
###   Cochran-Mantel-Haenszel test
### Aliases: power.cmh.test

### ** Examples

# From "Sample size determination for case-control studies and the comparison
# of stratified and unstratified analyses", (Nam 1992). See references.

# Uncorrected sample size estimate first introduced
# by Woolson and others in 1986
sample_size_uncorrected <- power.cmh.test(
  p2 = c(0.75,0.70,0.65,0.60),
  theta = 3,
  power = 0.9,
  t = c(0.10,0.40,0.35,0.15),
  alternative = "greater",
  correct = FALSE
)

print(sample_size_uncorrected, detail = FALSE)

# We see that the N is 171, the same as calculated by Nam
sample_size_uncorrected$N


# Continuity corrected sample size estimate added by Nam
sample_size_corrected <- power.cmh.test(
  p2 = c(0.75,0.70,0.65,0.60),
  theta = 3,
  power = 0.9,
  t = c(0.10,0.40,0.35,0.15),
  alternative = "greater",
  correct = TRUE
)

print(sample_size_corrected, n.frac = TRUE)

# We see that the N is indeed equal to that which is reported in the paper
sample_size_corrected$N




