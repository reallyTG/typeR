library(regsubseq)


### Name: test.gaplin
### Title: Detect and Test Almost Gap-Linear Subsequnces.
### Aliases: test.gaplin test.gaplin.t test.gaplin.p
### Keywords: htest

### ** Examples

  ## A sequence representing arrival times of events.
  Tn = c(13, 21, 24, 33, 40, 55, 59, 63, 72, 85, 87);

  ## Test for almost linearity.
  t = test.gaplin.t(Tn, 4);
  print(t$sub);
  p = test.gaplin.p(t$t, 10, 4);
  print(p);
  test.gaplin(Tn);



