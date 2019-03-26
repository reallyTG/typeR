library(etm)


### Name: plot.etm
### Title: Plot method for an etm object
### Aliases: plot.etm
### Keywords: hplot

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

my.etm <- etm(sir.cont,c("0","1","2"),tra,"cens", s = 0)

plot(my.etm, tr.choice = c("0 0"))



