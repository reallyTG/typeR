library(handlr)


### Name: codemeta_reader
### Title: codemeta reader
### Aliases: codemeta_reader

### ** Examples

# single
(z <- system.file('extdata/codemeta.json', package = "handlr"))
codemeta_reader(x = z)

# many
(z <- system.file('extdata/codemeta-many.json', package = "handlr"))
codemeta_reader(x = z)



