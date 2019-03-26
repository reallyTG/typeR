library(gmp)


### Name: Random
### Title: Generate a random number
### Aliases: urand.bigz
### Keywords: arith

### ** Examples

# Integers are differents
urand.bigz()
urand.bigz()
urand.bigz()

# Integers are the same
urand.bigz(seed="234234234324323")
urand.bigz(seed="234234234324323")

# Vector
urand.bigz(nb=50,size=30)



