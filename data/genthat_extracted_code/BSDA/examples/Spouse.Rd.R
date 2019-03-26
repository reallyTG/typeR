library(BSDA)


### Name: Spouse
### Title: Convictions in spouse murder cases by gender
### Aliases: Spouse
### Keywords: datasets

### ** Examples


T1 <- xtabs(~result + spouse, data = Spouse)
T1
chisq.test(T1)
rm(T1)




