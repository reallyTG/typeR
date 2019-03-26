library(BSDA)


### Name: Abortion
### Title: Abortion rate by region of country
### Aliases: Abortion
### Keywords: datasets

### ** Examples


T1 <- xtabs(~region + rate, data = Abortion)
T1
chisq.test(T1)




