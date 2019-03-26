library(mvna)


### Name: mvna
### Title: Nelson-Aalen estimator in multistate models
### Aliases: mvna
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

# plot
if (require(lattice))
xyplot(na)

### example with left-truncation
data(abortion)

# Data set modification in order to be used by mvna
names(abortion) <- c("id", "entry", "exit", "from", "to")
abortion$to <- abortion$to + 1

## computation of the matrix giving the possible transitions
tra <- matrix(FALSE, nrow = 5, ncol = 5)
tra[1:2, 3:5] <- TRUE

na.abortion <- mvna(abortion, as.character(0:4), tra, NULL)

plot(na.abortion, tr.choice = c("0 4", "1 4"),
     curvlab = c("Control", "Exposed"),
     bty = "n", legend.pos = "topleft")



