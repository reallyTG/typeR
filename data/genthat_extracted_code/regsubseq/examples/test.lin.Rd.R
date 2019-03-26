library(regsubseq)


### Name: test.lin
### Title: Detect and Test Almost Linear Subsequences.
### Aliases: test.lin test.lin.t test.lin.p
### Keywords: htest

### ** Examples

  ## A sequence representing arrival times of events.
  Tn = c(13, 21, 24, 33, 40, 55, 59, 63, 72, 85, 87);

  ## Test for almost linearity.
  t = test.lin.t(Tn, 4);
  print(t$sub);
  p = test.lin.p(t$t, 10, 4);
  print(p);
  test.lin(Tn);



