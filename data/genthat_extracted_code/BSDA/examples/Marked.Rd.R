library(BSDA)


### Name: Marked
### Title: Percent of marked cars in 65 police departments in Florida
### Aliases: Marked
### Keywords: datasets

### ** Examples


EDA(Marked$percent)
SIGN.test(Marked$percent, md = 60, alternative = "greater")
t.test(Marked$percent, mu = 60, alternative = "greater")




