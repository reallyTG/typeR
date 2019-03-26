library(relations)


### Name: charfun
### Title: Relation Characteristic Functions
### Aliases: relation_charfun
### Keywords: math

### ** Examples

## Relation 'a divides b':
divides <- function(a, b) b %% a == 0
R <- relation(domain = list(1 : 10, 1 : 10), charfun = divides)
R
## 'Recover' characteristic function:
"%|%" <- relation_charfun(R)

## Use it.
2L %|% 6L
2:4 %|% 6L
2L %|% c(2:3, 6L)

## This also works:
"%|%"(2L, 6L)
## (and more generally does for arities > 2).



