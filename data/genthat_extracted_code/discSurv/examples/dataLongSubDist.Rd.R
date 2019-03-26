library(discSurv)


### Name: dataLongSubDist
### Title: Data Matrix and Weights for Discrete Subdistribution Hazard
###   Models
### Aliases: dataLongSubDist
### Keywords: datagen

### ** Examples

# Example with unemployment data
library(Ecdat)
data(UnempDur)

# Generate subsample, reduce number of intervals to k = 5
SubUnempDur <- UnempDur [1:500, ]
SubUnempDur$time <- as.numeric(cut(SubUnempDur$spell, c(0,4,8,16,28)))

# Convert competing risks data to long format
# The event of interest is re-employment at full job
SubUnempDurLong <- dataLongSubDist (dataSet=SubUnempDur, timeColumn="time", 
eventColumns=c("censor1", "censor2", "censor3"), eventFocus="censor1")
head(SubUnempDurLong)

# Fit discrete subdistribution hazard model with logistic link function
logisticSubDistr <- glm(y ~ timeInt + ui + age + logwage,
                    family=binomial(), data = SubUnempDurLong, 
                    weights=SubUnempDurLong$subDistWeights)
summary(logisticSubDistr)




