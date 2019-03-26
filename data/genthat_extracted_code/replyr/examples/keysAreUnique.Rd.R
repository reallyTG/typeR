library(replyr)


### Name: keysAreUnique
### Title: Check uniqueness of rows with respect to keys.
### Aliases: keysAreUnique

### ** Examples


d <- data.frame(x=c(1,1,2,2,3,3), y=c(1,2,1,2,1,2))
tDesc1 <- tableDescription('d1', d)
tDesc2 <- tableDescription('d2', d)
tDesc <- rbind(tDesc1, tDesc2)
tDesc$keys[[2]] <- c(x='x')
keysAreUnique(tDesc)




