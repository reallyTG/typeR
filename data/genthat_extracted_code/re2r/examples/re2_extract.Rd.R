library(re2r)


### Name: re2_extract
### Title: Extract matching patterns from a string.
### Aliases: re2_extract re2_extract_all

### ** Examples

re2_extract("yabba dabba doo", "(.)")
re2_extract_all("yabba dabba doo", "(.)")

str <- c("Aster", "Azalea x2", "Baby's Breath", "Bellflower")
re2_extract(str, "\\d")
re2_extract(str, "[a-z]+")
re2_extract(str, "\\b\\w{1,3}\\b")

# Extract all matches
re2_extract_all(str, "[A-Za-z]+")
re2_extract_all(str, "\\b\\w{1,3}\\b")
re2_extract_all(str, "\\d")




