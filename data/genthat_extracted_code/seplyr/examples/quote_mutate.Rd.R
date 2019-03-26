library(seplyr)


### Name: quote_mutate
### Title: Capture the expressions of a mutate-style command.
### Aliases: quote_mutate

### ** Examples


assignments <- quote_mutate(a1 := 1, b1 = a1, a2 := 2, b2 := 7*(a1 + a2))
data.frame(x=1) %.>% mutate_se(., assignments)




