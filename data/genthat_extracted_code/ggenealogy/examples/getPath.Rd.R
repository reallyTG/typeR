library(ggenealogy)


### Name: getPath
### Title: Determine the path between two varieties
### Aliases: getPath

### ** Examples

data(sbGeneal)
ig <- dfToIG(sbGeneal)
getPath("Brim", "Bedford", ig, sbGeneal, "devYear")
getPath("Tokyo", "Volstate", ig, sbGeneal, "yield")



