library(qtl)


### Name: convert.map
### Title: Change map function for a genetic map
### Aliases: convert.map
### Keywords: manip

### ** Examples

data(listeria)
map <- pull.map(listeria)
map <- convert(map, "haldane", "kosambi")
listeria <- replace.map(listeria, map)



