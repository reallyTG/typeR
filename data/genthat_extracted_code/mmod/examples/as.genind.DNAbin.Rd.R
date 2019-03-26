library(mmod)


### Name: as.genind.DNAbin
### Title: as.genind.DNAbin
### Aliases: as.genind.DNAbin

### ** Examples

library(pegas)
data(woodmouse)
wm <- as.genind.DNAbin(woodmouse, rep(c("A", "B", "C"), each=5))
diff_stats(wm)



