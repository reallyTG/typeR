library(discSurv)

###############################
# contToDisc

set.seed(123)
randWeibull1 <- rweibull(n=100, shape=1, scale=1)
set.seed(123)
randNorm1 <- rnorm(n=100, mean=0, sd=1)
set.seed(123)
randBin1 <- rbinom(n=100, size=1, prob=0.75)
TestData1 <- data.frame(obsTime=randWeibull1, X1=randNorm1, X2=randBin1)
IntBorders <- seq(ceiling(min(randWeibull1)), ceiling(max(randWeibull1)), length.out=10)
TryTest1 <- contToDisc (dataSet=TestData1, timeColumn="obsTime", intervalLimits=IntBorders)
# Check length and rest of data
stopifnot(all.equal (TryTest1 [,-1], TestData1))
stopifnot(length(TryTest1 [, 1])==length(randWeibull1)) 
# Check all values
stopifnot(all.equal(which(randWeibull1 < IntBorders [1]), which(TryTest1 [, 1]==1)))
for(i in 2:10) {
  stopifnot(all.equal(which(randWeibull1 >= IntBorders [i-1] & randWeibull1 < IntBorders [i]), which(TryTest1 [, 1]==i)))
  cat("i = ", i, " correct", "\n")
}

################
# dataLong

set.seed(5678)
randMultinom2 <- apply(rmultinom(n=100, size=1, prob=rep(1/12,12)), 2, function (x) which(x==1))
set.seed(5678)
randBin2 <- rbinom(n=100, size=1, prob=0.75)
TestData2 <- data.frame(obsTime=randMultinom2, delta=randBin2)
TryTest2 <- dataLong (dataSet=TestData2, timeColumn="obsTime", censColumn="delta")
# Check if sum of time variable equals length of data.frame
stopifnot(sum(TestData2$obsTime)==dim(TryTest2) [1])
# Check if for each person there is only one event

# Remove last interval
shortFormat <- data.frame(event=rep(c(0, 1), 6), time=rep(1:6, 2))
shortFormatLong <- dataLong (dataSet=shortFormat, timeColumn="time", 
                             censColumn="event", remLastInt=TRUE)
# Check number of rows of long format after last interval removal
stopifnot(nrow(shortFormatLong)==(sum(rep(1:6, 2))-2))

# Preparation for risk score integration over time
shortFormatLong <- dataLong (dataSet=shortFormat, timeColumn="time", 
                             censColumn="event", aggTimeFormat=TRUE,
                             lastTheoInt=6)
stopifnot(nrow(shortFormatLong)==sum(rep(6, 12)) )

####################
# dataLongTimeDep

library(mvtnorm)

# Draw number of time obsevered points per person
set.seed(345)
randPo <- rpois (n=10, lambda=10)
NoObs <- sum(randPo)
ID <- rep(1:10, randPo)
# Draw observed times
set.seed(345)
randMultinom3 <- apply(rmultinom(n=NoObs, size=1, prob=rep(1/12, 12)), 2, function (x) which(x==1))
# Leave out replicates of same duration
SplitTimes <- sapply(split(randMultinom3, ID), function (x) unique(sort(x)))
# Replicate ID
Nobs <- as.numeric(sapply(SplitTimes, function (x) length(x)))
ID <- rep(1:10, Nobs)
SurvTimes <- as.numeric(do.call(c, SplitTimes))
# Draw events
IndizesEvents <- cumsum(as.numeric(sapply(SplitTimes, function (x) length(x))))
set.seed(375)
randBin3 <- rbinom(n=10, size=1, prob=2/3)
Events <- rep(0, sum(Nobs))
Events [IndizesEvents] <- randBin3
TestData3 <- data.frame(ID=ID, obsTime=SurvTimes, Event=Events)
# Add covariates
set.seed(400)
Covariates <- rmvnorm (n=dim(TestData3) [1], mean=rep(0, 5))
TestData3 <- cbind(TestData3, Covariates)
names(TestData3) [4:length(names(TestData3))] <- paste("X", 1:5, sep="")
TryTest3 <- dataLongTimeDep (dataSet=TestData3, timeColumn="obsTime", censColumn="Event", idColumn="ID")
head(TestData3, 20)
head(TryTest3, 20)

# Additional checks
# ID column is equal to generated obj column
stopifnot(all(TryTest3$obj==TryTest3$ID))
# All time variables per person are increasing and beginning with 1
SplitTryTest3 <- split(TryTest3, TryTest3$obj)
stopifnot(all(sapply(SplitTryTest3, function (x) all(x$timeInt==1:length(x$timeInt)))))
# Response is equal to replicated Event indicator
stopifnot(all(sapply(SplitTryTest3, function (x) all(x$y==x$Event))))

####################
# dataLongCompRisks

CheckFunction4 <- function (x) {
  
  # Description
  # Checks if events are appropiate 
  
  # Input
  # x: Object of type data.frame in long format split by persons
  
  # Output
  # TRUE if all checks are passed FALSE otherwise
  
  # Check if event in last row equals original data
  TempX <- x [, 3:6]
  RowsTempX <- dim(TempX) [1]
  TempX2 <- x [, 8:10]
  Index <- which(TempX [RowsTempX, ]==1)
  Check1 <- vector("logical", 1)
  
    if(Index == 1) {
      Check1 <- sum(TempX2 [RowsTempX, ])==0
    }
    
    if(Index != 1) {
      Check1 <- (Index-1)==which(TempX2 [RowsTempX, ]==1)
    }
    
  # Check if all previous rows are censored
  Check2 <- all(TempX [1:(RowsTempX-1), 1] == rep(1, RowsTempX-1))
  Check3 <- all(TempX [1:(RowsTempX-1), 2] == rep(0, RowsTempX-1))
  Check4 <- all(TempX [1:(RowsTempX-1), 3] == rep(0, RowsTempX-1))
  Check5 <- all(TempX [1:(RowsTempX-1), 4] == rep(0, RowsTempX-1))
  
  return(all(Check1, Check2, Check3, Check4))
  
}

set.seed(8010)
randMultinom4 <- apply(rmultinom(n=100, size=1, prob=rep(1/12,12)), 2, function (x) which(x==1))
set.seed(402345)
randEvents <- rmultinom(n=100, size=1, prob=c(3/4, 1/4, 1/4))
randEvents <- t(randEvents)
set.seed(-45556)
Covariates <- rmvnorm (n=100, mean=rep(0, 5))
TestData4 <- data.frame(obsTime=randMultinom4, randEvents, Covariates)
names(TestData4) [2:length(names(TestData4))] <- c("E1", "E2", "E3", paste("X", 1:5, sep="")) 
# Remove some observed events to have censored examples
set.seed(-234)
sampleCens <- sample(1:100, size=10)
TestData4[sampleCens, paste("E", 1:3, sep="")] <- 0
TryTest4 <- dataLongCompRisks (dataSet=TestData4, timeColumn="obsTime", eventColumns=c("E1", "E2", "E3"))
head(TryTest4, 20)

# Additional checks
SplitTryTest4 <- split(TryTest4, TryTest4$obj)
# All time variables per person are increasing and beginning with 1
stopifnot(all(sapply(SplitTryTest4, function (x) all(x$timeInt==1:length(x$timeInt)))))
# Sum of events is always 1
stopifnot(all(sapply(SplitTryTest4, function (x) all(rowSums (x [,3:6])==rep(1, dim(x [,3:6]) [1])) )))
# Length of time intervals equals obsTime
stopifnot(all(sapply(SplitTryTest4, function (x) all(tail(x$timeInt, 1)==tail(x$obsTime, 1)) ) ))
# Check if responses are equal to given data
stopifnot(all(sapply(SplitTryTest4, CheckFunction4)))

###########################
# dataCensoring

CheckFunction5 <- function (x) {
  
  # Description
  # Checks if censoring variable is correct specified
  
  # Input
  # x: Object of type data.frame in long format split by persons
  
  # Output
  # Gives TRUE if censoring variable is correct and FALSE otherwise
  
  Check1 <- 0
  
  if(tail(x$y, 1)==1) {
    Check1 <- is.na(tail(x$yCens, 1)) & sum(x$yCens [-length(x$yCens)])==0
  }
  
  if(tail(x$y, 1)==0) {
    Check1 <- tail(x$yCens, 1)==1 & sum(x$yCens [-length(x$yCens)])==0
  }
  
  return(Check1)
}

TryTest5 <- dataCensoring (dataSetLong=TryTest2, respColumn="y", 
                           timeColumn="timeInt")
head(TryTest5, 20)
SplitTryTest5 <- split(TryTest5, TryTest5$obj)

# Additional check
stopifnot(all(sapply(SplitTryTest5, CheckFunction5)))

#########################
# dataCensoringShort

TryTestShort <- dataCensoringShort (dataSet=TestData2, eventColumns="delta", 
                                    timeColumn="obsTime")
yCensTrue <- ifelse(TestData2$delta==0, 1, 0)
remIndices <- yCensTrue==0 & TestData2$obsTime==1
yCensTrue <- yCensTrue[!remIndices]
stopifnot(all.equal(TryTestShort$yCens, yCensTrue))

# Check competing risks case
# Two events
# tmax=3

evalGrid <- expand.grid(e1=c(0, 1), e2=c(0, 1), timeInt=1:3)
evalGrid <- evalGrid[!(rowSums(evalGrid[, paste("e", 1:2, sep="")])==2), ]
evalGridCensShort <- dataCensoringShort (dataSet=evalGrid, 
                                         eventColumns=paste("e", 1:2, sep=""),
                                         timeColumn="timeInt")
trueYcens <- ifelse(rowSums(evalGrid[, c("e1", "e2")])==0, 1, 0)
remIndices <- trueYcens==0 & evalGrid$timeInt==1
trueYcens <- trueYcens[!remIndices]
stopifnot(all(evalGridCensShort$yCens==trueYcens))

######################
# dataLongSubDistr

TestData4LongSubDist <- dataLongSubDist(dataSet=TestData4, 
                 timeColumn="obsTime", eventColumns=c("E1", "E2", "E3"), 
                 eventFocus="E1", timeAsFactor=FALSE)
TestData4LongSubDist

# Checks

#######################
# Event Focus at time T
stopifnot(length(TestData4LongSubDist[TestData4LongSubDist$E1==1, "y"])==
            sum(TestData4[TestData4$E1==1, "obsTime"]))
# Example: First observation (short format)
theoryTime <- 1:TestData4[1, "obsTime"]
theoryY <- c(rep(0, TestData4[1, "obsTime"]-1), 1)
stopifnot(all(TestData4LongSubDist[theoryTime, "timeInt"]==theoryTime))
stopifnot(all(TestData4LongSubDist[theoryTime, "y"]==theoryY))
# Check case specific weights
stopifnot(all.equal(TestData4LongSubDist[theoryTime, "subDistWeights"], 
          rep(1, length(TestData4LongSubDist[theoryTime, "subDistWeights"]))))

#######################
# Other event at time T
stopifnot(length(TestData4LongSubDist[rowSums(TestData4LongSubDist[, 
            c("E1", "E2", "E3")])==1 & TestData4LongSubDist$E1==0, "y"])==
            sum(rep(max(TestData4[, "obsTime"]), sum(rowSums(TestData4[, 
            c("E1", "E2", "E3")])==1 & TestData4$E1==0))))
# Example: Second observation (short format)
theoryTime <- 1:max(TestData4[, "obsTime"])
theoryY <- rep(0, max(TestData4[, "obsTime"]))
Indices <- (TestData4[1, "obsTime"]+1):
  (TestData4[1, "obsTime"]+max(TestData4[, "obsTime"]))
stopifnot(all(TestData4LongSubDist[Indices, "timeInt"]==theoryTime))
stopifnot(all(TestData4LongSubDist[Indices, "y"]==theoryY))
# Check case specific weights
# Up to T
IndicesT <- (TestData4[1, "obsTime"]+1):
  (TestData4[1, "obsTime"]+TestData4[2, "obsTime"])
stopifnot(all.equal(TestData4LongSubDist[IndicesT, "subDistWeights"], 
                    rep(1, length(TestData4LongSubDist[IndicesT, "subDistWeights"]))))
# After T up to t_max
IndicesAfterT <- (TestData4[1, "obsTime"]+TestData4[2, "obsTime"]+1):
  (TestData4[1, "obsTime"]+max(TestData4[, "obsTime"]))
# Estimate censoring survival function
estG <- estSurvCens(dataSet=TestData4, timeColumn="obsTime", eventColumns=c("E1", "E2", "E3"))
trueWeights <- unname(estG[IndicesAfterT-TestData4[1, "obsTime"] ] / estG[ TestData4[2, "obsTime"] ])
stopifnot(all.equal(TestData4LongSubDist[IndicesAfterT, "subDistWeights"], 
                    trueWeights))

################################
# Censored observation at time C

stopifnot(length(TestData4LongSubDist[rowSums(TestData4LongSubDist[, 
            c("E1", "E2", "E3")])==0, "y"])==
            sum(TestData4[rowSums(TestData4[, c("E1", "E2", "E3")])==0, "obsTime"]))
# Example: Third observation (short format)
theoryTime <- 1:TestData4[3, "obsTime"]
theoryY <- rep(0, TestData4[3, "obsTime"])
Indices <- (TestData4[1, "obsTime"]+max(TestData4[, "obsTime"])+1):
  (TestData4[1, "obsTime"]+max(TestData4[, "obsTime"])+TestData4[3, "obsTime"])
stopifnot(all(TestData4LongSubDist[Indices, "timeInt"]==theoryTime))
stopifnot(all(TestData4LongSubDist[Indices, "y"]==theoryY))
# Check case specific weights
stopifnot(all.equal(TestData4LongSubDist[Indices, "subDistWeights"], 
                    rep(1, length(TestData4LongSubDist[Indices, "subDistWeights"]))))

####################################
# Time dependent competing risks

# Example Primary Biliary Cirrhosis data
library(survival)

# Select subset
pbcseqTemp <- pbcseq[c(which(pbcseq$status==0)[1:56], which(pbcseq$status==1)[1:24], which(pbcseq$status==2)[1:67]), ]

# Convert to months
pbcseqTemp$day <- ceiling(pbcseqTemp$day/30)+1
names(pbcseqTemp) [7] <- "month"
pbcseqTemp$status <- factor(pbcseqTemp$status)

# Convert to long format for time varying effects
pbcseqTempLong <- dataLongCompRisksTimeDep(dataSet=pbcseqTemp, timeColumn="month", 
                                       eventColumns="status", eventColumnsAsFactor=TRUE, idColumn="id", 
                                       timeAsFactor=TRUE)

# Convert to long format for time varying effects
respMat <- model.matrix(~status, pbcseqTemp)[, -1]
pbcseqTemp2 <- cbind(pbcseqTemp, respMat)
pbcseqTempLong2 <- dataLongCompRisksTimeDep(dataSet=pbcseqTemp2, timeColumn="month", 
                                           eventColumns=c("status1", "status2"), 
                                           eventColumnsAsFactor=FALSE, 
                                           idColumn="id", timeAsFactor=TRUE)

# Checks
# Are the rowsums of the event colums all equal to one?
stopifnot(all(rowSums(pbcseqTempLong[, paste("e", 0:2, sep="")])==1))
# Does status and the event coding match?
splitpbcseqTempLong <- split(pbcseqTempLong, pbcseqTempLong$obj)
tailSplit <- sapply(splitpbcseqTempLong, function(x) {
  tailTemp <- tail(x, 1)
  checkVec <- rep(0, 3)
  checkVec[as.numeric(as.character(tailTemp$status)) + 1] <- 1
  return(all(tailTemp[, paste("e", 0:2, sep="")] == checkVec))
})
stopifnot(all(tailSplit))

