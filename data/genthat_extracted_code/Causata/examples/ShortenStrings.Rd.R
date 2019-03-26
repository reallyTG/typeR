library(Causata)


### Name: ShortenStrings
### Title: Shortens strings by replacing the middle with a separator.
### Aliases: ShortenStrings

### ** Examples

# only leading / trailing whitespace is removed
ShortenStrings(' abcdefghijklmnopqrstuvwxyz ', max.len=26)

# the middle is replaced with ...
ShortenStrings(' abcdefghijklmnopqrstuvwxyz ', max.len=20)

# the beginning is replaced with ...
# note that end.len is too long, it is silently set to 17 here.
ShortenStrings(' abcdefghijklmnopqrstuvwxyz ', max.len=20, end.len=20)

# the end is replaced with ...
ShortenStrings(' abcdefghijklmnopqrstuvwxyz ', max.len=20, end.len=0)



