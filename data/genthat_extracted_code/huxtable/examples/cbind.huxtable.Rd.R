library(huxtable)


### Name: cbind.huxtable
### Title: Combine rows or columns
### Aliases: cbind.huxtable rbind.huxtable

### ** Examples

ht1 <- hux(a = 1:3, b = 4:6)
ht2 <- hux(
        d = letters[1:3],
        e = letters[4:6]
      )
bold(ht1)[1, ] <- TRUE
bold(ht2) <- TRUE
vec <- LETTERS[1:3]

cbind(ht1, vec, ht2)
cbind(ht1, vec, ht2,
      copy_cell_props = FALSE)




