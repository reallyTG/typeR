library(FAOSTAT)


### Name: indConstruct
### Title: Construct indices
### Aliases: indConstruct

### ** Examples

test.df = data.frame(FAOST_CODE = rep(1, 100), Year = 1901:2000,
                      test = 1:100)
indConstruct(test.df, origVar = "test", baseYear = 1950)



