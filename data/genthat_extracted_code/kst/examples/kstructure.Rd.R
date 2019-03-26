library(kst)


### Name: kstructure
### Title: Knowledge Structure
### Aliases: kstructure kfamset
### Keywords: math

### ** Examples

# An endorelation representing a surmise relation
kst <- endorelation(graph=set(tuple(1,1), tuple(2,2), tuple(3,3),
  tuple(4,4), tuple(2,1), tuple(3,1), tuple(4,1),
  tuple(3,2), tuple(4,2)))
kstructure(kst)
# A set of sets representing knowledge states (e.g., clauses of a surmise system)
kst <- set(set("a"), set("a","b"), set("a","c"), set("d","e"), set("a","b","d","e"), 
   set("a","c","d","e"), set("a","b","c","d","e"))
kstructure(kst)
# Turning off the quotes for displaying purposes
sets_options("quote",FALSE)
kfamset(kst)



