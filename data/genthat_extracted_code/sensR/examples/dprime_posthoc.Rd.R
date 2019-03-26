library(sensR)


### Name: posthoc
### Title: Post-hoc estimates and tests for multiple discrimination
###   experiments.
### Aliases: posthoc posthoc.dprime_compare posthoc.dprime_test
### Keywords: models

### ** Examples


## Make some fake data:
n <- rep(40, 4)
x <- c(25, 25, 30, 35)
protocol <- c("triangle", "duotrio", "threeAFC", "twoAFC")
## Look at the data table with d-primes etc.:
dprime_table(x, n, protocol)

## 'any differences' test:
## ML estimation and test with likelihood statistic:
(dpc <- dprime_compare(x, n, protocol))

posthoc(dpc, alpha=.1) ## test="pairwise"

## Test if each d' is different from the common d' estimated from the
## remaining experiments:
posthoc(dpc, test="common")

## Test if d' from experiment 2 is different from the others (with
## adjustment for multiplicity):
posthoc(dpc, test="base", base=2)

## Test if each d' is different from 2 (with Bonferroni adjustment for
## multiplicity) using the Wald statistic:
posthoc(dpc, test=2, stat="Wald", padj.method="bonferroni")




