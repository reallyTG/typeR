library(RVowpalWabbit)


### Name: vw
### Title: Run the Vowpal Wabbit fast out-of-core learner
### Aliases: vw
### Keywords: misc

### ** Examples

  ## also see demo(vw) from which this is a subset

  library(RVowpalWabbit)

  # Test 3: without -d, training only
  # {VW} train-sets/0002.dat    -f models/0002.model
  test3 <- c("-t", system.file("test", "train-sets", "0002.dat", package="RVowpalWabbit"),
             "-f", file.path(tempdir(), "0002.model"),
             "--cache_file", file.path(tempdir(), "0002.cache"))

  res <- vw(test3)
  res



