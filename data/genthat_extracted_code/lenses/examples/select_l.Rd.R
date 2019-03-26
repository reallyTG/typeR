library(lenses)


### Name: select_l
### Title: Tidyselect elements by name
### Aliases: select_l

### ** Examples

lets <- setNames(seq_along(LETTERS), LETTERS)
set(lets, select_l(G:F, A, B), 1:4) # A and B are 3,4 for a quick check



