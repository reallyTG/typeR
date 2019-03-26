library(BSDA)


### Name: Ferraro1
### Title: Choice of presidental ticket in 1984 by gender
### Aliases: Ferraro1
### Keywords: datasets

### ** Examples


T1 <- xtabs(~gender + candidate, data = Ferraro1)
T1
chisq.test(T1)  
rm(T1)




