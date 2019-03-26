context("Log-logistic function")

baseline <- 0
asymptote <- 1

expect_equal(L4(1, 1, baseline, asymptote, 2), 0.119202922)

## Asymptote is attained under infinite dose
expect_equal(L4(Inf, 1, baseline, asymptote, 2), asymptote)

## If dose is null, response stays at baseline
expect_equal(L4(0, 1, baseline, asymptote, 2), baseline)

## Check that log(EC50) works alright for current
expect_equal(L4(pi, 1, baseline, asymptote, log(pi)),
             (asymptote - baseline)/2)
