library(BTYD)


### Name: bgnbd.pmf.General
### Title: Generalized BG/NBD Probability Mass Function
### Aliases: bgnbd.pmf.General

### ** Examples

params <- c(0.243, 4.414, 0.793, 2.426)
# probability that a customer will make 10 repeat transactions in the
# time interval (1,2]
bgnbd.pmf.General(params, t.start=1, t.end=2, x=10)
# probability that a customer will make no repeat transactions in the
# time interval (39,78]
bgnbd.pmf.General(params, t.start=39, t.end=78, x=0)



