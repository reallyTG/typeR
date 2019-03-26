library(pegas)


### Name: diffHaplo
### Title: Comparison Between Two Haplotypes
### Aliases: diffHaplo
### Keywords: manip

### ** Examples

data(woodmouse)
h <- haplotype(woodmouse)
diffHaplo(h) # compares the 1st and 2nd haplotypes
diffHaplo(h, 1, 3)
diffHaplo(h, "I", "III") # same than above but using labels



