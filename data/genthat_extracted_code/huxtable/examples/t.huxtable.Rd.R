library(huxtable)


### Name: t.huxtable
### Title: Transpose a huxtable
### Aliases: t.huxtable

### ** Examples

ht <- huxtable(
        a = 1:3,
        b = letters[1:3],
        autoformat = FALSE
      )
bottom_border(ht)[3,] <- 1
ht
t(ht)




