library(coin)


### Name: CorrelationTests
### Title: Correlation Tests
### Aliases: spearman_test spearman_test.formula
###   spearman_test.IndependenceProblem fisyat_test fisyat_test.formula
###   fisyat_test.IndependenceProblem quadrant_test quadrant_test.formula
###   quadrant_test.IndependenceProblem koziol_test koziol_test.formula
###   koziol_test.IndependenceProblem
### Keywords: htest

### ** Examples

## Asymptotic Spearman test
spearman_test(CONT ~ INTG, data = USJudgeRatings)

## Asymptotic Fisher-Yates test
fisyat_test(CONT ~ INTG, data = USJudgeRatings)

## Asymptotic quadrant test
quadrant_test(CONT ~ INTG, data = USJudgeRatings)

## Asymptotic Koziol-Nemec test
koziol_test(CONT ~ INTG, data = USJudgeRatings)



