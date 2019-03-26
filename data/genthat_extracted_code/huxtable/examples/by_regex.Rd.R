library(huxtable)


### Name: by_regex
### Title: Map cells matching a string or regex to cell properties
### Aliases: by_regex

### ** Examples

ht <- hux("The cat sat", "on the", "mat")

map_bold(ht, by_regex("at" = TRUE))
map_bold(ht, by_regex("a.*a" = TRUE))

map_bold(ht, by_regex(
        "the" = TRUE,
        .grepl_args = list(
          ignore.case = TRUE
        )
      ))



