library(scales)


### Name: ordinal_format
### Title: Ordinal formatter: add ordinal suffixes (-st, -nd, -rd, -th) to
###   numbers.
### Aliases: ordinal_format ordinal ordinal_english ordinal_french
###   ordinal_spanish

### ** Examples

ordinal_format()(1:10)
ordinal(1:10)

# Custom rules for French
french <- list(
  er = "^1$",
  nd = "^2$",
  e = "."
)
ordinal(1:20, rules = french)

# You can also use directly
ordinal(1:20, rules = ordinal_french())



