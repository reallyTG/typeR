library(ore)


### Name: ore.search
### Title: Search for matches to a regular expression
### Aliases: [.orematch [.orematches is.orematch is_orematch ore.search
###   ore_search orematch print.orematch print.orematches

### ** Examples

# Pick out pairs of consecutive word characters
match <- ore.search("(\\w)(\\w)", "This is a test", all=TRUE)

# Find the second matched substring ("is", from "This")
match[2]

# Find the content of the second group in the second match ("s")
match[2,2]



