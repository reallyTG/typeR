library(RcppAlgos)


### Name: comboSample
### Title: Sample combinations/permutations
### Aliases: comboSample permuteSample

### ** Examples

set.seed(11)
comboSample(30, 15, TRUE, n = 10)

set.seed(2)
permuteSample(15, 10, freqs = sample(1:2, 15, TRUE), 
              sampleVec = c(1, 10^2, 10^5, 10^8, 10^11))
              
all.equal(comboSample(10, 5, 
            sampleVec = 1:comboCount(10, 5)),
         comboGeneral(10, 5))
         
## Examples with enormous number of total permutations
num = permuteCount(10000, 20)
gmp::log2.bigz(num)
## [1] 265.7268

first = gmp::urand.bigz(n = 1, size = 265, seed = 123)
mySamp = do.call(c, lapply(0:10, function(x) gmp::add.bigz(first, x)))

class(mySamp)
## [1] "bigz"

## using permuteSample
pSamp = permuteSample(10000, 20, sampleVec = mySamp)

## using permuteGeneral
pGeneral = permuteGeneral(10000, 20, 
                          lower = first,
                          upper = gmp::add.bigz(first, 10))

identical(pSamp, pGeneral)
## [1] TRUE



