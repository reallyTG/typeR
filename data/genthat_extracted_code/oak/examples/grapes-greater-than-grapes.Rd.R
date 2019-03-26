library(oak)


### Name: %->%
### Title: Add a tree at the bottom of a chain
### Aliases: %->%

### ** Examples

## Chain
(tr0 = c_("Bob", "Carl", "Daniel"))

## Rooted tree
(tr1 = c_("Bill", "Caroline", "Dimitri", "Enoc"))
(tr2 = c_("John", "Thomas"))
(tr3 = r_("Alice", s = list(tr1, tr2))) 

## Linking both
tr0 %->% tr3




