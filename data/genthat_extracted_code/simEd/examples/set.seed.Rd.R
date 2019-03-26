library(simEd)


### Name: set.seed
### Title: Seeding Random Variate Generators
### Aliases: set.seed

### ** Examples

set.seed(8675309)
rexp(3, rate = 2)  # explicit call of stats::rexp

set.seed(8675309)
vexp(3, rate = 2)  # also uses stats::rexp

set.seed(8675309)
vexp(3, rate = 2, stream = 1) # uses rstream and stats::qexp
vexp(3, rate = 2, stream = 2)
rexp(3, rate = 2) # explicit call of stats::rexp, starting with seed 8675309

set.seed(8675309)
vexp(1, rate = 2, stream = 1) # uses rstream and stats::qexp
vexp(1, rate = 2, stream = 2)
vexp(1, rate = 2, stream = 1)
vexp(1, rate = 2, stream = 2)
vexp(1, rate = 2, stream = 1)
vexp(1, rate = 2, stream = 2)
vexp(3, rate = 2)             # calls stats::rexp, starting with seed 8675309



