library(riskyr)


### Name: as_pb
### Title: Display a percentage as a (rounded) probability.
### Aliases: as_pb

### ** Examples

as_pb(1/3)          # => 0.0033
as_pb(as_pc(2/3))   # => 0.6667 (rounded to 4 decimals)

prob.seq <- seq(0, 1, by = 1/10)
perc.seq <- seq(0, 100, by = 10)

as_pc(prob.seq)  # =>   0  10  20  30  40  50  60  70  80  90 100
as_pb(perc.seq)  # => 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0

perc.seq == as_pc(as_pb(perc.seq))            # => all TRUE
prob.seq == as_pb(as_pc(prob.seq))            # => some FALSE due to rounding errors!
round(prob.seq, 4) == as_pb(as_pc(prob.seq))  # => all TRUE (both rounded to 4 decimals)




