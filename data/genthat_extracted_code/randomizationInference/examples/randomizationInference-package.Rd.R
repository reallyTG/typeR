library(randomizationInference)


### Name: randomizationInference
### Title: Flexible Randomization-Based Inference
### Aliases: randomizationInference-package randomizationInference
### Keywords: package

### ** Examples

## Completely randomized design example
## with one treatment factor at two levels
w = c(rep(0,5), rep(1,5))
y = rnorm(10, mean = 0, sd = 1)
## Two-sided test
twoSidedTest = randTest(y, w, nrand = 50, calcTestStat = diffMeans)
randInterval(twoSidedTest)
randPlot(twoSidedTest)
## One-sided test
oneSidedTest = randTest(y, w, nrand = 50, calcTestStat = diffMeans,
    alternative = "greater")
## Two=sided test with non-zero null hypothesis
nonZeroTest = randTest(y, w, nrand = 50, calcTestStat = diffMeans,
    calcPO = constEffect, poOptions = list(tau = 2), null = 2)

## Randomized block design example
## with one treatment factor at three levels
x = rep(1:3,4)
w_block = rep(1:4,3)
y_block = rnorm(12, mean = x, sd = 1)
blockTest = randTest(y_block, w_block, nrand = 50,
    calcTestStat = anovaF, calcOptions = list(block = x),
    randOptions = list(type = "block", block = x))
randInterval(blockTest)
randPlot(blockTest)

## 4x4 Latin square example (from the Wu/Hamada reference)
row = rep(1:4,4)
col = c(rep(1,4),rep(2,4),rep(3,4),rep(4,4))
w_latin = c("C","D","B","A","A","B","D","C",
    "D","C","A","B","B","A","C","D")
y_latin = c(235,236,218,268,251,241,227,229,
    234,273,274,226,195,270,230,225)
latinTest = randTest(y_latin, w_latin, nrand = 50,
    calcTestStat = anovaF,
    calcOptions = list(row = row, col = col),
    randOptions = list(type = "Latin", row = row, col = col))
randInterval(latinTest)
randPlot(latinTest)

## User-defined randomization example
## Partial randomization: first four assignments are fixed
## Due to physical limitations
## User-defined randomization function
## Input: number of random assignments, function options
## Output: list of random assignments
myRand = function(nrand,userOptions = NULL){
	w_fixed = c(0,0,1,1)
	lapply(1:nrand, function(i) c(w_fixed, sample(rep(0:1,5))))
}
w_user = c(c(0,0,1,1),c(0,1,1,0,0,0,1,1,0,1)) #observed assignment
y_user = rnorm(14, mean = 0, sd = 1)
userTest = randTest(y_user, w_user, nrand = 50, calcTestStat = diffMeans,
    randOptions = list(type = "user.defined"), userRand = myRand)
randInterval(userTest)
randPlot(userTest)

## 2^3 factorial design example
## three treatment factors (OT, CP, and ST) at two levels each
OT = c(-1,-1,-1,-1,1,1,1,1)
CP = c(-1,-1,1,1,-1,-1,1,1)
ST = rep(c(-1,1), 4)
w_fac = cbind(OT, CP, ST)
y_fac = c(67,79,61,75,59,90,52,87)
## Testing the main effect of factor "OT"
facTest1 = randTest(y_fac, w_fac, nrand = 50, calcTestStat = diffMeans,
    calcOptions = list(factor = 1, pair = c(-1,1)))
## Testing all three main effects simultaneously
facTest2 = randTest(y_fac, w_fac, nrand = 50,
    calcTestStat = diffMeansVector, calcOptions = list(factors = 1:3,
        pairs = matrix(rep(c(-1,1),3),ncol=2,byrow=TRUE)))
## Testing all contrasts simultaneously
w_facNew = cbind(OT, CP, ST, OT*CP, OT*ST, CP*ST, OT*CP*ST)
facTest3 = randTest(y_fac, w_facNew, nrand = 50,
    calcTestStat = diffMeansVector, calcOptions = list(factors = 1:7,
        pairs = matrix(rep(c(-1,1),7),ncol=2,byrow=TRUE)))
randInterval(facTest3)
randPlot(facTest3, plotDim = c(2, 4))

## Reading comprehension pre- and post-test example
data(reading)
## Ignoring blocks
readingTest1=randTest(y = reading$Diff1, w = reading$Group, nrand = 50,
    calcTestStat = anovaF)
## Testing within-block pairwise effects
readingTest2=randTest(y = reading$Diff1, w = reading$Group, nrand = 50,
    calcTestStat = withinBlockEffects,
    calcOptions = list(block = reading$Block,
        pairs = rbind(c("Basal", "DRTA"), c("Basal", "Strat"),
            c("DRTA", "Strat"), c("Basal", "DRTA"),
            c("Basal", "Strat"), c("DRTA", "Strat")),
        blockindex = c(rep(1,3), rep(2,3))),
    randOptions = list(type = "block", block = reading$Block))
randInterval(readingTest2)
randPlot(readingTest2, plotDim = c(2, 3))



