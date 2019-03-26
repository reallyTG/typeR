library(mvna)


### Name: plot.mvna
### Title: Plot method for a mvna object
### Aliases: plot.mvna
### Keywords: hplot survival

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

tra <- matrix(ncol=3,nrow=3,FALSE)
tra[1, 2:3] <- TRUE
tra[2, c(1, 3)] <- TRUE

na.cont <- mvna(sir.cont,c("0","1","2"),tra,"cens")

plot(na.cont, tr.choice=c("0 2", "1 2"))



