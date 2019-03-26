library(seplyr)


### Name: mutate_seb
### Title: Run a sequence of quoted mutate blocks.
### Aliases: mutate_seb

### ** Examples


plan <- partition_mutate_qt(a1 := 1, b1 := a1, a2 := 2, b2 := a1 + a2)
print(plan)
d <- data.frame(x = 1) %.>% mutate_seb(., plan)
print(d)




