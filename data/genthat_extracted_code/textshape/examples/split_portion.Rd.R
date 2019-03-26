library(textshape)


### Name: split_portion
### Title: Break Text Into Ordered Word Chunks
### Aliases: split_portion
### Keywords: chunks group text

### ** Examples

with(DATA, split_portion(state, n.chunks = 10))
with(DATA, split_portion(state, n.words = 10))
with(DATA, split_portion(state, n.chunks = 10, as.string=FALSE))
with(DATA, split_portion(state, n.chunks = 10, rm.unequal=TRUE))
with(DATA, split_portion(state, person, n.chunks = 10))
with(DATA, split_portion(state, list(sex, adult), n.words = 10))
with(DATA, split_portion(state, person, n.words = 10, rm.unequal=TRUE))

## Bigger data
with(hamlet, split_portion(dialogue, person, n.chunks = 10))
with(hamlet, split_portion(dialogue, list(act, scene, person), n.chunks = 10))
with(hamlet, split_portion(dialogue, person, n.words = 300))
with(hamlet, split_portion(dialogue, list(act, scene, person), n.words = 300))



