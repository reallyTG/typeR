library(proteomics)


### Name: meetSelection
### Title: Data parsing - from Proteom Discover v1.4
### Aliases: meetSelection

### ** Examples

## Not run: 
##D bio1 <- read.csv("my-proteome-discoverer-v1.4-export-experiment-1.csv")
##D bio2 <- read.csv("my-proteome-discoverer-v1.4-export-experiment-2.csv")
##D run1 <- droplevels(bio1[bio1$Quan.Usage == "Used",])
##D run2 <- droplevels(bio2[bio2$Quan.Usage == "Used",])
##D channels <- c("X113", "X114", "X115", "X116", "X117", "X118", "X119", "X121")
##D reference <- c("X121")
##D 
##D run1 <- meetSelection(run1, channels, reference)
##D run2 <- meetSelection(run2, channels, reference)
##D 
##D run1$experiment <- factor(1, levels=1:2, labels=c("iTRAQ-1", "iTRAQ-2"))
##D run2$experiment <- factor(2, levels=1:2, labels=c("iTRAQ-1", "iTRAQ-2"))
##D runs <- rbind(run1, run2)
## End(Not run)



