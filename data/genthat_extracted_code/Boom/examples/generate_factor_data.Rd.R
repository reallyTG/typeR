library(Boom)


### Name: GenerateFactorData
### Title: Generate a data frame of all factor data
### Aliases: GenerateFactorData

### ** Examples

  foo <- GenerateFactorData(list(a = c("foo", "bar", "baz"),
                                 b = c("larry", "moe", "curly", "shemp")),
                            50)

  head(foo)
#     a     b
# 1 bar curly
# 2 foo curly
# 3 bar   moe
# 4 bar   moe
# 5 baz curly
# 6 bar curly




