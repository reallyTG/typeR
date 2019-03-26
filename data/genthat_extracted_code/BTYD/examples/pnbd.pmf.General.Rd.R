library(BTYD)


### Name: pnbd.pmf.General
### Title: Generalized Pareto/NBD Probability Mass Function
### Aliases: pnbd.pmf.General

### ** Examples

params <- c(0.55, 10.56, 0.61, 11.64)
# probability that a customer will make 10 repeat transactions in the
# time interval (1,2]
pnbd.pmf.General(params, t.start=1, t.end=2, x=10)
# probability that a customer will make no repeat transactions in the
# time interval (39,78]
pnbd.pmf.General(params, t.start=39, t.end=78, x=0)



