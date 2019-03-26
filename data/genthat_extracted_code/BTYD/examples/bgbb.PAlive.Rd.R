library(BTYD)


### Name: bgbb.PAlive
### Title: BG/BB P(Alive)
### Aliases: bgbb.PAlive

### ** Examples

params <- c(1.20, 0.75, 0.66, 2.78)

# The probability that a customer who made 3 transactions in
# the calibration period (which consisted of 6 transaction
# opportunities), with the last transaction occurring at the
# 4th transaction opportunity, is alive at the 7th transaction
# opportunity
bgbb.PAlive(params, x=3, t.x=4, n.cal=6)

# The input parameters may also be vectors:
bgbb.PAlive(params, x=1, t.x=1:6, n.cal=6)



