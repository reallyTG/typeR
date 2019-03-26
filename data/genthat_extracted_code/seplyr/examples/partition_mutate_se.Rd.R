library(seplyr)


### Name: partition_mutate_se
### Title: Partition a sequence of mutate commands into longest ordered no
###   create/use blocks.
### Aliases: partition_mutate_se

### ** Examples


partition_mutate_se(c("a1" := "1", "b1" := "a1", "a2" := "2", "b2" := "a1 + a2"))




