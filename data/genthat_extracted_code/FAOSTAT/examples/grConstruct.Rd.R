library(FAOSTAT)


### Name: grConstruct
### Title: Construct Growth rate
### Aliases: grConstruct

### ** Examples

test.df2 = data.frame(FAOST_CODE = rep(c(1, 5000), each = 5),
                       Year = rep(1990:1994, 2),
                       a = rep(1:5, 2), b = rep(1:5, 2))
grConstruct(test.df2, origVar = "a", type = "geo", n = 1)
grConstruct(test.df2, origVar = "a", type = "geo", n = 3)
grConstruct(test.df2, origVar = "a", type = "geo", n = 5)



