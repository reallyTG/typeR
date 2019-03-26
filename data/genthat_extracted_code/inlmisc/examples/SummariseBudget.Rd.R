library(inlmisc)


### Name: SummariseBudget
### Title: Summarize MODFLOW Water Budget
### Aliases: SummariseBudget
### Keywords: utilities

### ** Examples

path <- system.file("extdata", "ex.bud", package = "inlmisc")
out <- SummariseBudget(path, desc = "river leakage", id = "iface")
print(out)




