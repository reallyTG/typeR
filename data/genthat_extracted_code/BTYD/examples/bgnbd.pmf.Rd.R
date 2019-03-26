library(BTYD)


### Name: bgnbd.pmf
### Title: BG/NBD Probability Mass Function
### Aliases: bgnbd.pmf

### ** Examples

params <- c(0.243, 4.414, 0.793, 2.426)
# probability that a customer will make 10 repeat transactions in the
# time interval (0,2]
bgnbd.pmf(params, t=2, x=10)
# probability that a customer will make no repeat transactions in the
# time interval (0,39]
bgnbd.pmf(params, t=39, x=0)

# Vectors may also be used as arguments:
bgnbd.pmf(params, t=30, x=11:20)



