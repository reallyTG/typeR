library(triebeard)


### Name: alter
### Title: Add or remove trie entries
### Aliases: alter trie_add trie_remove

### ** Examples

trie <- trie("foo", "bar")
length(trie)

trie_add(trie, "baz", "qux")
length(trie)

trie_remove(trie, "baz")
length(trie)




