library(BTYD)


### Name: pnbd.pmf
### Title: Pareto/NBD Probability Mass Function
### Aliases: pnbd.pmf

### ** Examples

params <- c(0.55, 10.56, 0.61, 11.64)
# probability that a customer will make 10 repeat transactions in the
# time interval (0,2]
pnbd.pmf(params, t=2, x=10)
# probability that a customer will make no repeat transactions in the
# time interval (0,39]
pnbd.pmf(params, t=39, x=0)

# Vectors may also be used as arguments:
pnbd.pmf(params, t=30, x=11:20)



