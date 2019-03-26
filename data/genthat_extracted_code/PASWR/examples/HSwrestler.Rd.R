library(PASWR)


### Name: HSwrestler
### Title: High School Wrestlers
### Aliases: HSwrestler
### Keywords: datasets

### ** Examples

FAT <- c(HSwrestler$HWFAT, HSwrestler$TANFAT, HSwrestler$SKFAT)
GROUP <- factor(rep(c("HWFAT", "TANFAT", "SKFAT"), rep(78, 3)))
BLOCK <- factor(rep(1:78, 3))
friedman.test(FAT~GROUP|BLOCK)



