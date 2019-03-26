library(dagitty)


### Name: AncestralRelations
### Title: Ancestral Relations
### Aliases: AncestralRelations adjacentNodes ancestors children
###   descendants markovBlanket neighbours parents spouses

### ** Examples

g <- dagitty("graph{ a <-> x -> b ; c -- x <- d }")
descendants(g,"x")
parents(g,"x")
spouses(g,"x") 




