library(simmer.bricks)


### Name: interleave
### Title: Interleaved Resources
### Aliases: interleave

### ** Examples

## These are equivalent:
trajectory() %>%
  interleave(c("A", "B"), c(2, 10), 1)

trajectory() %>%
  seize("A", 1) %>%
  timeout(2) %>%
  seize("B_token", 1) %>%
  release("A", 1) %>%
  seize("B", 1) %>%
  timeout(10) %>%
  release("B", 1) %>%
  release("B_token", 1)




