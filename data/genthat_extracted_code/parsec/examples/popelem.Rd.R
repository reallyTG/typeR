library(parsec)


### Name: popelem
### Title: popelem
### Aliases: popelem popelem.wprof

### ** Examples

vl <- c(2, 3, 2)
prf <- var2prof(varlen = vl)
pop <- matrix(c(2, 1, 1, 1, 2, 1, 2, 3, 1), 3, 3)
rownames(pop) <- LETTERS[1:3]

v <- popelem(prof = prf, y = pop)
v
prf$profiles[v,]



