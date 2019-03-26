library(affluenceIndex)


### Name: boot.r1
### Title: Bootstrap standard error 1
### Aliases: boot.r1
### Keywords: indboot

### ** Examples

data(affluence)
boot3 <-boot.r1(affluence$income[1:300], 0.9,500, "r.is")
boot3$summary

boot4 <-boot.r1(affluence$income[1:300], 2, 500, "r.hc")
boot4$summary



