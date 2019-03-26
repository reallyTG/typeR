library(nipals)


### Name: uscrime
### Title: U.S. Crime rates per 100,00 people
### Aliases: uscrime
### Keywords: datasets

### ** Examples


library(nipals)
head(uscrime)

# SAS deletes rows with missing values
dat <- uscrime[complete.cases(uscrime), ]
dat <- as.matrix(dat[ , -1])
m1 <- nipals(dat) # complete-data method

# Traditional NIPALS with missing data  
dat <- uscrime
dat <- as.matrix(dat[ , -1])
m2 <- nipals(dat, gramschmidt=FALSE) # missing 
round(crossprod(m2$loadings),3) # Prin Comps not quite orthogonal
  
# Gram-Schmidt corrected NIPALS
m3 <- nipals(dat, gramschmidt=TRUE) # TRUE is default
round(crossprod(m3$loadings),3) # Prin Comps are orthogonal




