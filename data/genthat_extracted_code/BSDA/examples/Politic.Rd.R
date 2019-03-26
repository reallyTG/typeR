library(BSDA)


### Name: Politic
### Title: Political party and gender in a voting district
### Aliases: Politic
### Keywords: datasets

### ** Examples


T1 <- xtabs(~party + gender, data = Politic)
T1
chisq.test(T1)
rm(T1)




