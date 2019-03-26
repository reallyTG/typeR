library(BSDA)


### Name: Funeral
### Title: Cost of funeral by region of country
### Aliases: Funeral
### Keywords: datasets

### ** Examples


T1 <- xtabs(~region + cost, data = Funeral)
T1
chisq.test(T1)  
rm(T1)




