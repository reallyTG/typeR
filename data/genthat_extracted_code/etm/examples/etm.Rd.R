library(etm)


### Name: etm
### Title: Computation of the empirical transition matrix
### Aliases: etm etm.data.frame
### Keywords: survival

### ** Examples

data(sir.cont)

# Modification for patients entering and leaving a state
# at the same date
# Change on ventilation status is considered
# to happen before end of hospital stay
sir.cont <- sir.cont[order(sir.cont$id, sir.cont$time), ]
for (i in 2:nrow(sir.cont)) {
  if (sir.cont$id[i]==sir.cont$id[i-1]) {
    if (sir.cont$time[i]==sir.cont$time[i-1]) {
      sir.cont$time[i-1] <- sir.cont$time[i-1] - 0.5
    }
  }
}

### Computation of the transition probabilities
# Possible transitions.
tra <- matrix(ncol=3,nrow=3,FALSE)
tra[1, 2:3] <- TRUE
tra[2, c(1, 3)] <- TRUE

# etm
tr.prob <- etm(sir.cont, c("0", "1", "2"), tra, "cens", 1)

tr.prob
summary(tr.prob)

# plotting
if (require("lattice")) {
xyplot(tr.prob, tr.choice=c("0 0", "1 1", "0 1", "0 2", "1 0", "1 2"),
       layout=c(2, 3), strip=strip.custom(bg="white",
         factor.levels=
     c("0 to 0", "1 to 1", "0 to 1", "0 to 2", "1 to 0", "1 to 2")))
}

### example with left-truncation

data(abortion)

# Data set modification in order to be used by etm
names(abortion) <- c("id", "entry", "exit", "from", "to")
abortion$to <- abortion$to + 1

## computation of the matrix giving the possible transitions
tra <- matrix(FALSE, nrow = 5, ncol = 5)
tra[1:2, 3:5] <- TRUE

## etm
fit <- etm(abortion, as.character(0:4), tra, NULL, s = 0)

## plot
xyplot(fit, tr.choice = c("0 0", "1 1", "0 4", "1 4"),
       ci.fun = c("log-log", "log-log", "cloglog", "cloglog"),
       strip = strip.custom(factor.levels = c("P(T > t) -- control",
                                              "P(T > t) -- exposed",
                                 "CIF spontaneous abortion -- control",
                                 "CIF spontaneous abortion --
exposed")))



