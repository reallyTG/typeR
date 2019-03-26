library(dplyr)


### Name: combine
### Title: Combine vectors
### Aliases: combine

### ** Examples

# combine applies the same coercion rules as bind_rows()
f1 <- factor("a")
f2 <- factor("b")
c(f1, f2)
unlist(list(f1, f2))

combine(f1, f2)
combine(list(f1, f2))



