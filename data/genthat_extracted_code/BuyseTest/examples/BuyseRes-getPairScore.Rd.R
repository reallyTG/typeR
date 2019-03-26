library(BuyseTest)


### Name: getPairScore
### Title: Extract the Score of Each Pair
### Aliases: getPairScore BuyseRes-getPairScore
###   getPairScore,BuyseRes-method
### Keywords: BuyseRes-method get

### ** Examples

## run BuyseTest
data(veteran,package="survival")

BT.keep <- BuyseTest(trt ~ tte(time, threshold = 20, censoring = "status") + cont(karno),
                     data = veteran, keep.pairScore = TRUE, 
                     trace = 0, method.inference = "none")

## Extract scores
pScore <- getPairScore(BT.keep, endpoint = 1)

## look at one pair
pScore[91]

## retrive pair in the original dataset
pVeteran <- veteran[pScore[91,c(index.1,index.2)],]
pVeteran

## the observation from the control group is censored at 97
## the observation from the treatment group has an event at 112
## since the threshold is 20, and (112-20)<97
## we know that the pair is not in favor of the treatment

## the formula for probability in favor of the control is
## Sc(97)/Sc(112+20)
## where Sc(t) is the survival at time t in the control arm.

## we first estimate the survival in each arm
e.KM <- prodlim(Hist(time,status)~trt, data = veteran)

## and compute the survival
iSurv <- predict(e.KM, times =  c(97,112+20), newdata = data.frame(trt = 1))[[1]]

## the probability in favor of the control is then
pUF <- iSurv[2]/iSurv[1]
pUF
## and the complement to one of that is the probability of being neutral
pN <- 1 - pUF
pN

if(require(testthat)){
   testthat::expect_equal(pUF, pScore[91, unfavorable])
   testthat::expect_equal(pN, pScore[91, neutral])
}



