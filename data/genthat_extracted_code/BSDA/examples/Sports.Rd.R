library(BSDA)


### Name: Sports
### Title: Favorite sport by gender
### Aliases: Sports
### Keywords: datasets

### ** Examples


T1 <- xtabs(~gender + sport, data = Sports)
T1
chisq.test(T1)
rm(T1)




