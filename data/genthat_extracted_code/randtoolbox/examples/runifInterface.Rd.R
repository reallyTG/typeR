library(randtoolbox)


### Name: runifInterface
### Title: Functions for using runif() and rnorm() with randtoolbox
###   generators
### Aliases: runifInterface set.generator put.description get.description
### Keywords: distribution

### ** Examples

#set WELL19937a
set.generator("WELL", version="19937a", seed=12345)
runif(5)

#Store the current state  and generate 10 random numbers
storedState <- get.description()
x <- runif(10)

#Park Miller congruential generator
set.generator(name="congruRand", mod=2^31-1, mult=16807, incr=0, seed=12345)
runif(5)
setSeed(12345)
congruRand(5, dim=1, mod=2^31-1, mult=16807, incr=0)

# the Knuth Lewis RNG
set.generator(name="congruRand", mod="4294967296", mult="1664525", incr="1013904223", seed=1)
runif(5)
setSeed(1)
congruRand(5, dim=1, mod=4294967296, mult=1664525, incr=1013904223)

#Restore the generator from storedState and regenerate the same numbers
put.description(storedState)
x == runif(10)

# generate the same random numbers as in Matlab
set.generator("MersenneTwister", initialization="init2002", resolution=53, seed=12345)
runif(5)
# [1] 0.9296161 0.3163756 0.1839188 0.2045603 0.5677250
# Matlab commands rand('twister', 12345); rand(1, 5) generate the same numbers,
# which in short format are   0.9296    0.3164    0.1839    0.2046    0.5677

#Restore the original R setting
set.generator("default")
RNGkind()




