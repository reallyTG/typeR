library(cultevo)


### Name: mantel.test
### Title: Perform one or more Mantel permutation tests.
### Aliases: mantel.test mantel.test.default mantel.test.formula
###   mantel.test.list plot.mantel

### ** Examples

# small distance matrix, Mantel test run deterministically
mantel.test(dist(1:7), dist(1:7))


## Not run: 
##D # run test on smallest distance matrix which requires a random
##D # permutation test, and plot it
##D plot(mantel.test(dist(1:8), dist(1:8), method="kendall"))
## End(Not run)

## Not run: 
##D # 2x2x2x2 design
##D mantel.test(hammingdists(enumerate.meaningcombinations(c(2, 2, 2, 2))),
##D   dist(1:16), plot=TRUE)
## End(Not run)

# using the formula interface in combination with a data frame:
print(data <- cbind(word=c("aa", "ab", "ba", "bb"),
  enumerate.meaningcombinations(c(2, 2))))

mantel.test(word ~ Var1 + Var2, data)

## Not run: 
##D # pass a list of distance matrices as the first argument, but just one
##D # distance matrix as the second argument: this runs separate tests on
##D # the pairwise combinations of the first and second argument
##D result <- mantel.test(list(dist(1:8), dist(sample(8:1)), dist(runif(8))),
##D   hammingdists(enumerate.meaningcombinations(c(2, 2, 2))))
##D 
##D # print the result of the three independently run permutation tests
##D print(result)
##D 
##D # show the three test results in one plot
##D plot(result, xlab="group")
## End(Not run)



