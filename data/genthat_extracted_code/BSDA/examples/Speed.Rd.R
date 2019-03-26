library(BSDA)


### Name: Speed
### Title: Speed reading scores before and after a course on speed reading
### Aliases: Speed
### Keywords: datasets

### ** Examples


t.test(Speed$differ, alternative = "greater")
t.test(Speed$signranks, alternative = "greater")
wilcox.test(Speed$after, Speed$before, paired = TRUE, alternative = "greater")




