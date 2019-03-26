library(riskyr)


### Name: as_pc
### Title: Display a probability as a (rounded) percentage.
### Aliases: as_pc

### ** Examples

as_pc(.50)                # =>  50
as_pc(1/3)                # =>  33.33
as_pc(1/3, n.digits = 0)  # =>  33

as_pc(pi)                 # => 314.16 + Warning that prob is not in range.
as_pc(as_pb(12.3))        # =>  12.3

prob.seq <- seq(0, 1, by = 1/10)
perc.seq <- seq(0, 100, by = 10)

as_pc(prob.seq)  # =>   0  10  20  30  40  50  60  70  80  90 100
as_pb(perc.seq)  # => 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0

perc.seq == as_pc(as_pb(perc.seq))            # => all TRUE
prob.seq == as_pb(as_pc(prob.seq))            # => some FALSE due to rounding errors!
round(prob.seq, 4) == as_pb(as_pc(prob.seq))  # => all TRUE (both rounded to 4 decimals)




