library(DescTools)


### Name: PMT
### Title: Periodic Payment of an Annuity.
### Aliases: PMT IPMT PPMT RBAL
### Keywords: arith

### ** Examples

# original principal:    20'000
# loan term (years):     5
# annual interest rate:  8%
# annual payment:        -4'156.847

# simple amortization schedule
cbind(
  year      = 1:5,
  payment   = PMT(rate=0.08, nper=5, pv=20000, fv=-5000, type=0),
  interest  = IPMT(rate=0.08, per=1:5, nper=5, pv=20000, fv=-5000, type=0),
  principal = PPMT(rate=0.08, per=1:5, nper=5, pv=20000, fv=-5000, type=0),
  balance   = RBAL(rate=0.08, per=1:5, nper=5, pv=20000, fv=-5000, type=0)
)

#     year   payment   interest principal   balance
# [1,]    1 -4156.847 -1600.0000 -2556.847 17443.153
# [2,]    2 -4156.847 -1395.4523 -2761.395 14681.759
# [3,]    3 -4156.847 -1174.5407 -2982.306 11699.452
# [4,]    4 -4156.847  -935.9562 -3220.891  8478.562
# [5,]    5 -4156.847  -678.2849 -3478.562  5000.000





