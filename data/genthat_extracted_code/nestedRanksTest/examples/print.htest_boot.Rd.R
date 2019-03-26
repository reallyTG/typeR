library(nestedRanksTest)


### Name: print.htest_boot
### Title: Print result held in 'htest_boot' object
### Aliases: print.htest_boot

### ** Examples

data(woodpecker_multiyear)
## n.iter set to 1000 to shorten completion time
res <- nestedRanksTest(Distance ~ Year | Granary, n.iter = 1000,
                       data = woodpecker_multiyear,
                       subset = Species == "agrifolia")
class(res)
print(res)



