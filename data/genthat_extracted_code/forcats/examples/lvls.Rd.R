library(forcats)


### Name: lvls
### Title: Low-level functions for manipulating levels
### Aliases: lvls lvls_reorder lvls_revalue lvls_expand

### ** Examples

f <- factor(c("a", "b", "c"))
lvls_reorder(f, 3:1)
lvls_revalue(f, c("apple", "banana", "carrot"))
lvls_expand(f, c("a", "b", "c", "d"))



