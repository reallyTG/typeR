library(seplyr)


### Name: partition_mutate_qt
### Title: Partition a sequence of mutate commands into longest ordered no
###   create/use blocks.
### Aliases: partition_mutate_qt

### ** Examples


plan <- partition_mutate_qt(a1 := 1, b1 := a1, a2 := 2, b2 := a1 + a2)
print(plan)
d <- data.frame(x = 1) %.>% mutate_seb(., plan)
print(d)





