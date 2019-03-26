library(mvna)


### Name: sir.cont
### Title: Ventilation status in intensive care unit patients
### Aliases: sir.cont
### Keywords: datasets survival

### ** Examples

data(sir.cont)

# Matrix of possible transitions
tra <- matrix(ncol=3,nrow=3,FALSE)
tra[1, 2:3] <- TRUE
tra[2, c(1, 3)] <- TRUE

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

# Computation of the Nelson-Aalen estimates
  na.cont <- mvna(sir.cont,c("0","1","2"),tra,"cens")

if (require("lattice")) {
  xyplot(na.cont,tr.choice=c("0 2","1 2"),aspect=1,
       strip=strip.custom(bg="white",
         factor.levels=c("No ventilation -- Discharge/Death",
           "Ventilation -- Discharge/Death"),
         par.strip.text=list(cex=0.9)),
       scales=list(alternating=1),xlab="Days",
       ylab="Nelson-Aalen estimates")
}



