library(BSDA)


### Name: Snore
### Title: Snoring versus heart disease
### Aliases: Snore
### Keywords: datasets

### ** Examples


T1 <- xtabs(~ heartdisease + snore, data = Snore)
T1
chisq.test(T1)
rm(T1)




