library(StratigrapheR)


### Name: bedtext
### Title: Writes the names of the beds in a litholog
### Aliases: bedtext

### ** Examples

l  <- c(0,4,5,8)
r  <- c(4,5,8,16)

x   <- c(4,5,3,4)
i <- c("B1","B2","B3","B4")

test <- litholog(l, r, x, i)

whiteSet(xlim = c(0,6), ylim = c(-10,30))

multigons(test$i, test$xy, test$dt, col = c(NA, "black", "grey","NA"))

bedtext(labels = i, r = r, l = l, edge = TRUE, x = 0.5,
        arg = list(col = c("black", "white", "white", "red")))




