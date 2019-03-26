library(ecr)


### Name: setup
### Title: Set up parameters for evolutionary operator.
### Aliases: setup

### ** Examples

# initialize bitflip mutator with p = 0.3
bf = setup(mutBitflip, p = 0.3)
# sample binary string
x = sample(c(0, 1), 100, replace = TRUE)

set.seed(1)
# apply preinitialized function
print(bf(x))

set.seed(1)
# apply raw function
print(mutBitflip(x, p = 0.3))

# overwrite preinitialized values with mutate
ctrl = initECRControl(fitness.fun = function(x) sum(x), n.objectives = 1L)
# here we define a mutation probability of 0.3
ctrl = registerECROperator(ctrl, "mutate", setup(mutBitflip, p = 0.3))
# here we overwrite with 1, i.e., each bit is flipped
print(x)
print(mutate(ctrl, list(x), p.mut = 1, p = 1)[[1]])



