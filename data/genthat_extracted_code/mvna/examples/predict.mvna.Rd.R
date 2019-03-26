library(mvna)


### Name: predict.mvna
### Title: Calculates Nelson-Aalen estimates at specified time-points
### Aliases: predict.mvna
### Keywords: survival

### ** Examples

data(sir.cont)

# Modification for patients entering and leaving a state
# at the same date
sir.cont <- sir.cont[order(sir.cont$id, sir.cont$time), ]
for (i in 2:nrow(sir.cont)) {
  if (sir.cont$id[i]==sir.cont$id[i-1]) {
    if (sir.cont$time[i]==sir.cont$time[i-1]) {
      sir.cont$time[i-1] <- sir.cont$time[i-1] - 0.5
    }
  }
}

# Matrix of logical giving the possible transitions
tra <- matrix(ncol=3,nrow=3,FALSE)
tra[1, 2:3] <- TRUE
tra[2, c(1, 3)] <- TRUE

# Computation of the Nelson-Aalen estimates
na <- mvna(sir.cont,c("0","1","2"),tra,"cens")

# Using predict
predict(na,times=c(1,5,10,15))



