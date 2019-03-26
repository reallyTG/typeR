library(scan)


### Name: power.testSC
### Title: Empirical power analysis for single-case data
### Aliases: power.testSC

### ** Examples

## Assume you want to conduct a single-case study with 15 MTs, using a highly reliable test,
## an expected level effect of \eqn{d = 1.4}, and randomized start points between MTs 5
## and 12 can you expect to identify the effect using plm or randomization test?

power.testSC(MT = 15, B.start = round(runif(100,5,12)), test.parameter = "level", 
             d.level = 1.4, rtt = 0.8, n = 10)

## Would you achieve higher power by setting up a MBD with three cases?

power.testSC(cases = 3, MT = 15, stat = c("rand.test","hplm"), 
             B.start = round(runif(300,5,12)), test.parameter = "level", 
             d.level = 1.4, rtt = 0.8, n = 10, startpoints = 5:12)



