library(parsec)


### Name: pop2prof
### Title: Population to profiles
### Aliases: pop2prof

### ** Examples

n <- 5
v1 <- as.ordered(c("a", "b", "c", "d"))
v2 <- 1:3
pop <- data.frame(
    v1 = sample(v1, n, replace = TRUE),
    v2 = sample(v2, n, replace = TRUE)
)
pop2prof(pop)



