library(Cprob)


### Name: pseudocpf
### Title: Pseudo values for the conditional probability function
### Aliases: pseudocpf
### Keywords: survival regression

### ** Examples

data(mgus)

cutoffs <- quantile(mgus$time, probs = seq(0, 1, 0.05))[-1]

### with fancy variance estimation
fit1 <- pseudocpf(Hist(time, ev) ~ age + creat, mgus, id = id,
                  timepoints = cutoffs, corstr = "independence",
                  scale.value = TRUE)
summary(fit1)

### with jackknife variance estimation
fit2 <- pseudocpf(Hist(time, ev) ~ age + creat, mgus, id = id,
                  timepoints = cutoffs, corstr = "independence",
                  scale.value = TRUE, jack = TRUE)
summary(fit2)



