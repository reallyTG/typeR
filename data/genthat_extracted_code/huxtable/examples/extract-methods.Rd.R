library(huxtable)


### Name: [.huxtable
### Title: Subset a huxtable
### Aliases: [.huxtable [<-.huxtable $<-.huxtable [[<-.huxtable

### ** Examples

ht <- huxtable(
        a = 1:3,
        b = letters[1:3]
      )

ht[1:2, ]
ht[, 1]
ht$a
ht <- huxtable(a = 1:3, b = 1:3)
ht2 <- huxtable(10:11, 12:13)
bold(ht2) <- TRUE
ht[2:3,] <- ht2
ht




