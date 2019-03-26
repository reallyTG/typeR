library(outbreaker2)


### Name: sim_ctd
### Title: Simulate contact data from a transmission tree
### Aliases: sim_ctd

### ** Examples


## load data
x <- fake_outbreak
tTree <- data.frame(from = x$ances, to = seq_along(x$ances))

## simulate contact data with coverage of 80% and 10% probability of
## contact between non-transmission pairs
ctd <- outbreaker2:::sim_ctd(tTree, eps = 0.8, lambda = 0.1)

## inspect contact data
head(ctd)



