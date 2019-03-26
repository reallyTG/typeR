library(uniqtag)


### Name: uniqtag
### Title: Abbreviate strings to short, unique identifiers.
### Aliases: uniqtag

### ** Examples

Sys.setlocale("LC_COLLATE", "C")
states <- sub(" ", "", state.name)
uniqtags <- uniqtag(states)
uniqtags4 <- uniqtag(states, k = 4)
uniqtags3 <- uniqtag(states, k = 3)
uniqtags3x <- uniqtag(states, k = 3, uniq = make_unique)
table(nchar(states))
table(nchar(uniqtags))
table(nchar(uniqtags4))
table(nchar(uniqtags3))
table(nchar(uniqtags3x))
uniqtags3[grep("-", uniqtags3x)]



