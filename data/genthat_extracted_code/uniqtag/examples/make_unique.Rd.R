library(uniqtag)


### Name: make_unique
### Title: Make character strings unique.
### Aliases: make_unique make_unique_all make_unique_all_or_none
###   make_unique_duplicates

### ** Examples

abcb <- c("a", "b", "c", "b")
make_unique(abcb)
make_unique_duplicates(abcb)
make_unique_all(abcb)
make_unique_all_or_none(abcb)
make_unique_all_or_none(c("a", "b", "c"))
x <- make_unique(abbreviate(state.name, 3, strict = TRUE))
x[grep("-", x)]



