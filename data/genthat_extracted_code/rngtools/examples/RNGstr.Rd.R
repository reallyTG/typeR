library(rngtools)


### Name: RNGstr
### Title: Formatting RNG Information
### Aliases: RNGstr RNGtype showRNG RNGinfo RNGdigest

### ** Examples

#--- RNGstr ---

# default is a 626-long integer
RNGstr()
# what would be the seed after seeding with set.seed(1234)
RNGstr(1234)
# another RNG (short seed)
RNGstr(c(401L, 1L, 1L))
# no validity check is performed 
RNGstr(2:3)


#--- RNGtype ---

# get RNG type
RNGtype()
RNGtype(provider=TRUE)
RNGtype(1:3)

# type from encoded RNG kind
RNGtype(107L)
# this is different from the following which treats 107 as a seed for set.seed
RNGtype(107)


#--- showRNG ---
showRNG()
# as after set.seed(1234)
showRNG(1234)
showRNG()
set.seed(1234)
showRNG()
# direct seeding
showRNG(1:3)
# this does not change the current RNG
showRNG()
showRNG(provider=TRUE)


#--- RNGinfo ---
# get info as a list
RNGinfo()
RNGinfo(provider=TRUE)
# from encoded RNG kind
RNGinfo(107)


#--- RNGdigest ---
# compute digest hash from RNG settings
RNGdigest()
RNGdigest(1234)
# no validity check is performed
RNGdigest(2:3)





