library(affluenceIndex)


### Name: boot.r2
### Title: Bootstrap standard error 2
### Aliases: boot.r2
### Keywords: indboot

### ** Examples

data(affluence)
boot1 <-boot.r2(affluence$income[1:300], 2,2,500, "r.cha")
boot1$summary

boot2 <-boot.r2(affluence$income[1:300], 2,2,500, "r.fgt")
boot2$summary



