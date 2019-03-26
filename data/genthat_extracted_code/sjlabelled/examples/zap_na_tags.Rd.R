library(sjlabelled)


### Name: zap_na_tags
### Title: Convert tagged NA values into regular NA
### Aliases: zap_na_tags

### ** Examples

library(haven)
x <- labelled(
  c(1:3, tagged_na("a", "c", "z"), 4:1),
  c("Agreement" = 1, "Disagreement" = 4, "First" = tagged_na("c"),
    "Refused" = tagged_na("a"), "Not home" = tagged_na("z"))
)
# get current NA values
x
get_na(x)
zap_na_tags(x)
get_na(zap_na_tags(x))

# also works with non-labelled vector that have tagged NA values
x <- c(1:5, tagged_na("a"), tagged_na("z"), NA)
haven::print_tagged_na(x)
haven::print_tagged_na(zap_na_tags(x))




