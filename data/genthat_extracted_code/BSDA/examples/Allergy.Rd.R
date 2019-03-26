library(BSDA)


### Name: Allergy
### Title: Allergy medicines by adverse events
### Aliases: Allergy
### Keywords: datasets

### ** Examples


T1 <- xtabs(~event + medication, data = Allergy)
T1
chisq.test(T1)




