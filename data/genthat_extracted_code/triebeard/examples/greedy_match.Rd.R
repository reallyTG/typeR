library(triebeard)


### Name: greedy_match
### Title: Greedily match against a tree
### Aliases: greedy_match

### ** Examples

trie <- trie(keys = c("afford", "affair", "available", "binary", "bind", "blind"),
                   values = c("afford", "affair", "available", "binary", "bind", "blind"))
greedy_match(trie, c("avoid", "bring", "attack"))




