library(psychotools)


### Name: MemoryDeficits
### Title: Memory Deficits in Psychiatric Patients
### Aliases: MemoryDeficits
### Keywords: datasets

### ** Examples

data("MemoryDeficits", package = "psychotools")
aggregate(cbind(E1, E2, E3, E4) ~ trial + group, MemoryDeficits, sum)



