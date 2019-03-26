library(BSDA)


### Name: Ferraro2
### Title: Choice of vice presidental candidate in 1984 by gender
### Aliases: Ferraro2
### Keywords: datasets

### ** Examples


T1 <- xtabs(~gender + candidate, data = Ferraro2)
T1
chisq.test(T1)  
rm(T1)




