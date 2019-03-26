library(permutations)


### Name: Ops.permutation
### Title: Arithmetic Ops Group Methods for permutations
### Aliases: Ops.permutation Ops cycle_sum group_action word_equal
###   word_prod word_prod_single permprod cycle_sum_single cycle_power
###   cycle_power_single vps ccps helper
### Keywords: symbolmath

### ** Examples

x <- rperm(20,9) # word form
y <- rperm(20,9) # word form

x*y  # word form

x^5  # coerced to cycle form

x^as.cycle(1:5)  # group action; coerced to word.

x*inverse(x) == id  # all TRUE



# the 'sum' of two permutations is defined if their cycles are disjoint:
as.cycle(1:4) + as.cycle(7:9)

data(megaminx)
megaminx[1] + megaminx[7:12] 






